import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../route_paths.dart';
import '../hero.dart';
import '../hero_service.dart';
@Component(
  selector: 'app-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  directives: [
    coreDirectives,
    routerDirectives,
  ],
)
class DashboardComponent implements OnInit{
  List<Hero> heroes;
  HeroService heroService;


  DashboardComponent(this.heroService);
  @override
  void ngOnInit() {
    this._getHeroes();
  }

  Future<void> _getHeroes() async{
    this.heroes = (await this.heroService.getAll()).skip(1).take(4).toList();
  }
  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam : '$id'});
}