import 'package:projecttest/src/data_acces/dummy_data_acces.dart';
import 'package:projecttest/src/interfaces/i_data_acces.dart';

class DataManager {
  final IDataAcces dataAcces;

  DataManager._(this.dataAcces);

  static final DataManager _data = DataManager._(DummyData());

  static DataManager get data => _data;

  factory DataManager() {
    return _data;
  }
}
