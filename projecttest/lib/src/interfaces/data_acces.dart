import 'package:projecttest/src/enums/category_enum.dart';
import 'package:projecttest/src/models/breakfast_model.dart';

abstract class IDataAccess {
  Map<CategoryEnum, bool> getCategory();
  List<BreakfastModel> getListProduct();
  void selectCategory();
  void filterResult();
}
