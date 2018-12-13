import 'dart:html';
import '../machine/Actions.dart';
import 'page.dart';

class IndexPage extends Page {
  ButtonElement _btnLogin;

  IndexPage():super() {
    _btnLogin = new ButtonElement();
    dom.className += "index";
    dom.style.backgroundColor = "#f1f1f1";
  }

  void render() {
    _btnLogin.addEventListener("click", _handleClickEvent);
    _btnLogin.text = "LOGIN";

    dom.children.add(_btnLogin);
  }

  void destroy() {
    _btnLogin.removeEventListener("click", _handleClickEvent);
    _btnLogin = null;

    super.destroy();
  }

  void _handleClickEvent(event) {
    dispatchAction( Actions.INDEX_PAGE_BUTTON_LOGIN_CLICKED );
  }
}