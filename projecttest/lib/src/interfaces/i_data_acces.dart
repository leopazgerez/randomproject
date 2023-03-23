import 'package:projecttest/src/enums/categorys_enum.dart';
import 'package:projecttest/src/models/itembreakfast_model.dart';

abstract class IDataAcces {
  Map<Categorys, bool> getCategorys();
  List<ItemBreakfastModel> getListItems();
}
