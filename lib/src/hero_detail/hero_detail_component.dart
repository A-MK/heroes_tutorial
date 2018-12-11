import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../hero_service.dart';
import '../hero.dart';

import '../route_paths.dart';

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
    if (id != null) this.hero = await this._heroService.getHeroById(id); 
  }

  void goBack() {
    this._location.back();
  }
}