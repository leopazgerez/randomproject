import 'package:projecttest/src/enums/category_enum.dart';
import 'package:projecttest/src/interfaces/data_acces.dart';
import 'package:projecttest/src/models/breakfast_model.dart';

class DummyData implements IDataAccess {

  @override
  Map<CategoryEnum, bool> getCategory(){
      return{
    CategoryEnum.capuccino: true,
    CategoryEnum.chocolate: false,
    CategoryEnum.cafe: false,
    CategoryEnum.jugo: false,
    CategoryEnum.mate: false,
    CategoryEnum.sopa: false,
  };
  }
  
  @override
  List<BreakfastModel> getProductList(){
    return [
    BreakfastModel(
      title: 'Capuccino',
      category: CategoryEnum.capuccino,
      subtitle: ' experto',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Chocolate',
      category: CategoryEnum.chocolate,
      subtitle: ' conseguir',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Cafe torrado',
      category: CategoryEnum.cafe,
      subtitle: 'con leche',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Cafe Negro',
      category: CategoryEnum.cafe,
      subtitle: 'sin azucar',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Cafe',
      category: CategoryEnum.cafe,
      subtitle: 'interacción',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Cafecito',
      category: CategoryEnum.cafe,
      subtitle: 'comprame unito',
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
      subtitle: 'previa',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'cortado',
      category: CategoryEnum.sopa,
      subtitle: 'visual',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Mate',
      category: CategoryEnum.mate,
      subtitle: 'La Ley Hick',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Sopa',
      category: CategoryEnum.sopa,
      subtitle: 'Ley de Tesler',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Capuccino9',
      category: CategoryEnum.capuccino,
      subtitle: ' personas',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Capuccino',
      category: CategoryEnum.capuccino,
      subtitle: 'esta',
      description: 'sdfsdf',
    ),
    BreakfastModel(
      title: 'Capuccino',
      category: CategoryEnum.capuccino,
      subtitle: 'Leyes',
      description: 'sdfsdf',
    ),
  ];
  }
  
  @override
  void selectCategory() {}

  @override
  void filterResult(){}
}
