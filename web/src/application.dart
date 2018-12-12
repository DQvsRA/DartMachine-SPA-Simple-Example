import 'dart:async';

import 'pages/page.navigator.dart';
import 'pages/gallery.page.dart';
import 'pages/index.page.dart';
import 'pages/login.page.dart';
import 'pages/page.dart';
import 'pages/signout.page.dart';

class Application {

  Page _currentPage;
  PageNavigator _navigator;
  StreamController _pipe = StreamController<String>();

  Application(PageNavigator navigator) {
    _navigator = navigator;
  }

  Stream<String> get actions {
    return _pipe.stream;
  }

  void goToLoginPage() {
    _navigateTo(new LoginPage(_pipe));
  }

  void goToIndexPage() {
    _navigateTo(new IndexPage(_pipe));
  }

  void goToGalleryPage() {
    _navigateTo(new GalleryPage(_pipe));
  }

  void goToSignoutPage() {
    _navigateTo(new SignoutPage(_pipe));
  }

  void _navigateTo(Page page) {
    _currentPage = _navigator.navigateFromTo(_currentPage, page);
  }
}