import 'package:projecttest/src/data_access/dummy.dart';
import 'package:projecttest/src/enums/category_enum.dart';
import 'package:projecttest/src/interfaces/data_acces.dart';
import 'package:projecttest/src/models/breakfast_model.dart';

class DataManager {
  final IDataAccess dataAcces;
  DataManager._(this.dataAcces);
  static final DataManager _instance = DataManager._(DummyData());
  static DataManager get instance => _instance;

  factory DataManager() {
    return _instance;
  }

  Map<CategoryEnum, bool> getCategory() {
    return dataAcces.getCategory();
  }

  List<BreakfastModel> getProductList() {
    return dataAcces.getProductList();
  }
}
