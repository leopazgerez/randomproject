import 'package:projecttest/src/enums/category_enum.dart';
import 'package:projecttest/src/interfaces/data_acces.dart';
import 'package:projecttest/src/models/breakfast_model.dart';

class DummyData implements IDataAccess {

  @override
  Map<CategoryEnum, bool> getCategory(){
      return{
    CategoryEnum.capuccino: true,
    CategoryEnum.chocolate: false,
    CategoryEnum.gorriadas: false,
    CategoryEnum.jugo: false,
    CategoryEnum.mate: false,
    CategoryEnum.sopa: false,
  };
  }
  
  @override
  List<BreakfastModel> getListProduct(){
    return [
    BreakfastModel(
      title: 'Capuccino',
      category: CategoryEnum.capuccino,
      subtitle: 'Hola',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Chocolate',
      category: CategoryEnum.chocolate,
      subtitle: 'como',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Gorriadas',
      category: CategoryEnum.gorriadas,
      subtitle: 'te sientes',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Jugo',
      category: CategoryEnum.jugo,
      subtitle: 'hoy',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'submarino',
      category: CategoryEnum.chocolate,
      subtitle: 'espero',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'cortado',
      category: CategoryEnum.sopa,
      subtitle: 'que muy',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Mate',
      category: CategoryEnum.sopa,
      subtitle: 'bien porque yo',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Sopa',
      category: CategoryEnum.sopa,
      subtitle: 'estoy sacando',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Capuccino9',
      category: CategoryEnum.capuccino,
      subtitle: 'clavos',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Capuccino',
      category: CategoryEnum.capuccino,
      subtitle: 'de tanto',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Capuccino',
      category: CategoryEnum.capuccino,
      subtitle: 'errarle',
      description: 'sdfsdf',
    ),
  ];
  }
  
  @override
  void selectCategory() {}

  @override
  void filterResult(){}
}
