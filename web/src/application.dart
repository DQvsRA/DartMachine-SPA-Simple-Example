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

  Application(PageNavigator navigator) {
    _navigator = navigator;
  }

  void goToLoginPage() {
    _navigateTo(new LoginPage());
  }

  void goToIndexPage() {
    _navigateTo(new IndexPage());
  }

  void goToGalleryPage() {
    _navigateTo(new GalleryPage());
  }

  void goToSignoutPage() {
    _navigateTo(new SignoutPage());
  }

  void _navigateTo(Page page) {
    _currentPage = _navigator.navigateFromTo(_currentPage, page);
  }
}