import '../model/model.dart';
import '../hero.dart';
import './actions.dart';

AppState appStateReducer(AppState state, action){
  return AppState(
    heroes: heroReducer(state.heroes, action)
  );
}

List<Hero> heroReducer(List<Hero> state, action){

  if(action is AddHeroAction){
    return []
    ..addAll(state)
    ..add(Hero(action.id, action.name));
  }
  if(action is RemoveHeroAction){
    return []
    ..addAll(state)
    ..removeWhere((hero) => (hero.id == action.hero.id));
  }

  if(action is UpdateHeroAction){
    final int index = state.indexWhere((hero) => (hero.id == action.hero.id));
    return []
    ..addAll(state)
    ..removeAt(index)
    ..insert(index, Hero(action.hero.id, action.newName));
  }
  return state;
}