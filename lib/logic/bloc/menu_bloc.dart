import 'dart:async';

import '../../model/menu.dart';
import '../viewmodel/menu_view_model.dart';



class MenuBloc {
  final _menuVM = MenuViewModel(menuItems: []);
  final menuController = StreamController<List<Menu>>();

  Stream<List<Menu>> get menuItems => menuController.stream;

  MenuBloc() {
    menuController.add(_menuVM.getMenuItems());
  }
}
