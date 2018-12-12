import 'dart:html';

import '../machine/Actions.dart';
import 'page.dart';

class LoginPage extends Page {
  ButtonElement _btnIndex;
  ButtonElement _btnGallery;

  LoginPage(pipe):super(pipe) {
    _btnIndex = ButtonElement();
    _btnGallery = ButtonElement();
    dom.style.backgroundColor = "wheat";
  }

  void render() {
    _btnIndex.addEventListener("click", _handleClickEvent);
    _btnIndex.text = "INDEX";

    _btnGallery.addEventListener("click", _handleClickEvent);
    _btnGallery.text = "GALLERY";

    dom.append(_btnIndex);
    dom.append(_btnGallery);
  }

  void destroy() {
    _btnIndex.removeEventListener("click", _handleClickEvent);
    _btnIndex = null;

    super.destroy();
  }

  void _handleClickEvent(Event event) {
    var ct = event.currentTarget;
    if (ct == _btnIndex) {
      dispatchAction( Actions.LOGIN_PAGE_BUTTON_INDEX_CLICKED );
    }
    else if (ct == _btnGallery) {
      dispatchAction( Actions.LOGIN_PAGE_BUTTON_GALLERY_CLICKED );
    }
  }
}