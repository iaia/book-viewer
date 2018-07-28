import 'dart:async';

import 'package:angular/angular.dart';

import 'viewer_service.dart';
import 'package:book_viewer/src/book/book.dart';

@Component(
  selector: 'viewer',
  styleUrls: ['viewer_component.css'],
  templateUrl: 'viewer_component.html',
  directives: [
    NgIf,
    NgFor,
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
}
