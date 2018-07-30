import 'dart:async';

import 'package:angular/angular.dart';

import 'viewer_service.dart';
import 'package:book_viewer/src/book/book.dart';
import 'package:book_viewer/src/book/page.dart';

@Component(
  selector: 'viewer',
  styleUrls: ['viewer_component.css'],
  templateUrl: 'viewer_component.html',
  directives: [
    NgIf,
    NgFor,
    NgClass,
  ],
  providers: [const ClassProvider(ViewerService)],
)
class ViewerComponent implements OnInit {
  final ViewerService viewerService;

  Book book = null;

  ViewerComponent(this.viewerService);

  @override
  Future<Null> ngOnInit() async {
    book = await viewerService.getBook();
  }

  void onClickPage(Page page) {
    int clickedIndex = book.pages.indexOf(page);
    // クリックされたのが最後のページor最初のページか調べる
    if (clickedIndex + 1 > book.pages.length - 1) {
      // 最後のページがclickされた
      book.pages[0].visible = true;
      book.pages[1].visible = true;
      book.pages[book.pages.length - 2].visible = false;
      book.pages[book.pages.length - 1].visible = false;
    } else if (clickedIndex == 0) {
      // 最初のページがクリックされた
      book.pages[book.pages.length - 2].visible = true;
      book.pages[book.pages.length - 1].visible = true;
      book.pages[0].visible = false;
      book.pages[1].visible = false;
    }
    // クリックされたのが右か左かを調べる
    // 判別は+1がvisibleなら右
    else if (book.pages[clickedIndex + 1].visible) {
      // 右なら左(+1)をhiddenにし、-1をvisibleにする
      book.pages[clickedIndex + 1].visible = false;
      book.pages[clickedIndex - 1].visible = true;
    } else {
      // 左なら右(-1)をhiddenにし、+1をvisibleにする
      book.pages[clickedIndex + 1].visible = true;
      book.pages[clickedIndex - 1].visible = false;
    }
  }
}
