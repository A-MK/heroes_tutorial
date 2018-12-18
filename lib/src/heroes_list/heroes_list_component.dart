import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import '../route_paths.dart';
import '../hero.dart';
import '../hero_service.dart';
import '../redux/actions.dart';

@Component(
  selector: 'heroes_list',
  styleUrls: ['heroes_list_component.css'],
  templateUrl: 'heroes_list_component.html',
  directives: [
    coreDirectives,
    MaterialSpinnerComponent,
  ],
  pipes: [commonPipes],
)
class HeroesListComponent implements OnInit{
  bool showNewHeroInput = false;
  Hero selected;
  Router _router;
  final HeroService _heroService;
  List<Hero> heroes;

  HeroesListComponent(this._heroService,this._router);

  onSelect(Hero hero) {
    // print("name: ${hero.name}, id: ${hero.id}");
    selected = hero;
  }

  Future<void> _getHeroes() async {
    this.heroes = await this._heroService.store.state.heroes;
  }

  @override
  void ngOnInit() {
    this._getHeroes();
    this._heroService.store.onChange.listen(
      (state) {
        this.heroes = state.heroes;
        });
  }
  
  Future<NavigationResult> gotoDetail() => this._router.navigate(
    RoutePaths.hero.toUrl(parameters: {idParam : selected.id.toString()})
    );

    removeHero(Hero hero) {
      this._heroService.store.dispatch(RemoveHeroAction(hero));
    }

    addHero(String name) {
      this._heroService.store.dispatch(AddHeroAction(name));
      showNewHeroInput = false;
    }
  
}
