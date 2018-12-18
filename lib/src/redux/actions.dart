import '../hero.dart';


class AddHeroAction {
  static num _id = 20;
  final String name;
  AddHeroAction(this.name){
    _id++;
  }
  num get id => _id; 
}

class RemoveHeroAction {
  final Hero hero;
  RemoveHeroAction(this.hero);
}

class UpdateHeroAction {
  final Hero hero;
  final String newName;
  UpdateHeroAction(this.hero, this.newName);
}