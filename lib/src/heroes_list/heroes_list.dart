import 'package:angular/angular.dart';
// import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/angular_components.dart';
import '../hero_detail/hero_detail.dart';

import '../hero.dart';
// import 'src/mock_heroes.dart';
import '../hero_service.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'heroes_list',
  styleUrls: ['heroes_list.css'],
  templateUrl: 'heroes_list.html',
  directives: [
    coreDirectives,
    // formDirectives,
    HeroDetailComponent,
    MaterialSpinnerComponent,
  ],
  providers: [
    // ClassProvider(HeroService),
  ],
)
class HeroesListComponent implements OnInit{
  Hero selected;
  final HeroService _heroService;
  List<Hero> heroes;

  HeroesListComponent(this._heroService);

  onSelect(Hero hero) {
    print("name: ${hero.name}, id: ${hero.id}");
    selected = hero;
  }

  Future<void> _getHeroes() async {
    this.heroes = await this._heroService.getAll();
  }

  @override
  void ngOnInit() {
    this._getHeroes();
  }
}
