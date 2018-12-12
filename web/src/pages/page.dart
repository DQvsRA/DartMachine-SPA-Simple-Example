import 'dart:async';
import 'dart:html';

abstract class Page {

  DivElement dom;
  StreamController<String> _pipe;

  Page(StreamController<String> pipe) {
    _pipe = pipe;
    dom = new DivElement();
    dom.className = "page ";
  }

  void dispatchAction(String action) { _pipe.add(action); }

  void render() { }
  void destroy() {
    dom = null;
    _pipe = null;
  }
}