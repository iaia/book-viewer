import 'dart:async';

import 'package:angular/angular.dart';

import 'viewer_service.dart';

@Component(
  selector: 'viewer',
  styleUrls: ['viewer_component.css'],
  templateUrl: 'viewer_component.html',
  directives: [
    NgFor,
  ],
  providers: [const ClassProvider(ViewerService)],
)
class ViewerComponent implements OnInit {
  final ViewerService viewerService;

  List<String> pages = [];

  ViewerComponent(this.viewerService);

  @override
  Future<Null> ngOnInit() async {
    pages = await viewerService.getPages();
  }
}
