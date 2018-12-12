import 'dart:html';
import 'package:dart_machine/dart_machine.dart';

import 'src/application.dart';
import 'src/machine/Actions.dart';
import 'src/machine/States.dart';
import 'src/pages/page.navigator.dart';

void main() {

  DivElement root = querySelector('#root');

  DartMachine pagesMachine = new DartMachine();

  PageNavigator navigator = new PageNavigator(root);
  Application application = new Application(navigator);

  pagesMachine.addState( States.INITIAL );
  
  pagesMachine.addState( States.PAGE_INDEX );
  pagesMachine.addState( States.PAGE_LOGIN );
  pagesMachine.addState( States.PAGE_GALLERY );
  pagesMachine.addState( States.PAGE_SIGNOUT );

  pagesMachine.addAction( States.INITIAL, States.PAGE_INDEX, Actions.INITIALIZE, () => application.goToIndexPage() );

  pagesMachine.addAction( States.PAGE_INDEX, States.PAGE_LOGIN, Actions.INDEX_PAGE_BUTTON_LOGIN_CLICKED, () => application.goToLoginPage() );

  pagesMachine.addAction( States.PAGE_LOGIN, States.PAGE_INDEX, Actions.LOGIN_PAGE_BUTTON_INDEX_CLICKED, () => application.goToIndexPage() );
  pagesMachine.addAction( States.PAGE_LOGIN, States.PAGE_GALLERY, Actions.LOGIN_PAGE_BUTTON_GALLERY_CLICKED, () => application.goToGalleryPage() );

  pagesMachine.addAction(
      States.PAGE_GALLERY,
      States.PAGE_INDEX,
      Actions.GALLERY_PAGE_BUTTON_INDEX_CLICKED, () => application.goToIndexPage() );

  pagesMachine.addAction(
      States.PAGE_GALLERY,
      States.PAGE_SIGNOUT,
      Actions.GALLERY_PAGE_BUTTON_EXIT_CLICKED, () => application.goToSignoutPage() );

  pagesMachine.addAction( States.PAGE_SIGNOUT, States.PAGE_INDEX, Actions.SIGNOUT_PAGE_TIMER_EXPIRED, () => application.goToIndexPage() );

  application.actions.listen((String action) async {
      print("\n> Main: application.action: " + action);
      pagesMachine.performAction( action );
      print("> Main: pagesMachine.currentState: " + pagesMachine.currentState());
  });

  pagesMachine.performAction( Actions.INITIALIZE );
}


