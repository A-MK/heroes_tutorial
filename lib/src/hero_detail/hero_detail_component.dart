import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../hero_service.dart';
import '../hero.dart';

import '../route_paths.dart';
import '../redux/actions.dart';
@Component(
  selector: 'hero-detail',
  templateUrl: 'hero_detail_component.html',
  styleUrls: ['hero_detail_component.css'],
  directives: [
    coreDirectives,
    formDirectives,
  ],
)
class HeroDetailComponent implements OnActivate {

  Hero hero;
  HeroService _heroService;
  Location _location;
  HeroDetailComponent(this._heroService,this._location);

  @override
  void onActivate(RouterState previous, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) {
      this.hero = this._heroService.store.state.heroes.firstWhere((hero) => (hero.id == id));
      this._heroService.store.onChange.listen((state) {
      this.hero = state.heroes.firstWhere((hero) => (hero.id == id)); 
    });
    } 
  }

  void goBack() {
    this._location.back();
  }

  void saveHero(String newName) {
    this._heroService.store.dispatch(UpdateHeroAction(this.hero, newName));
  }
}