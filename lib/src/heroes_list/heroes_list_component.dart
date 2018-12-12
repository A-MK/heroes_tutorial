import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import '../route_paths.dart';
import '../hero.dart';
import '../hero_service.dart';


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
    this.heroes = await this._heroService.getAll();
  }

  @override
  void ngOnInit() {
    this._getHeroes();
  }
  
  Future<NavigationResult> gotoDetail() => this._router.navigate(
    RoutePaths.hero.toUrl(parameters: {idParam : selected.id.toString()})
    );
  
}
