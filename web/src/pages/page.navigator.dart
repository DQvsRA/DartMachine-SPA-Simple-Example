import 'dart:html';

import 'page.dart';

class PageNavigator {

  DivElement _root;

  PageNavigator(DivElement root) { _root = root; }

  Page navigateFromTo(Page from, Page to) {
    if (from != null) {
      from.dom.remove();
      from.destroy();
    }
    to.render();
    _root.append(to.dom);
    return to;
  }
}