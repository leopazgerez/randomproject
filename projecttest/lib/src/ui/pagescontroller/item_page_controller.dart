import 'package:mvc_pattern/mvc_pattern.dart';

class ItemPageController extends ControllerMVC {
  ItemPageController._();
  static late ItemPageController _this;

  factory ItemPageController() {
    _this = ItemPageController._();
    return _this;
  }

  static ItemPageController get con => _this;
}
