class Page {
  String url;
  bool _visible;
  Page(this.url) {
    visible = false;
    setCurrentClasses();
  }

  bool get visible => _visible;
  set visible(bool v) {
    _visible = v;
    setCurrentClasses();
  }

  Map<String, bool> currentClasses = <String, bool>{};
  void setCurrentClasses() {
    currentClasses = <String, bool>{
      'page-content': true,
      'visible': visible,
    };
  }
}