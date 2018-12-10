import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/heroes_list/heroes_list.dart';
import 'src/hero_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [
    HeroesListComponent
  ],
  providers: [
    ClassProvider(HeroService)
  ],
)
class AppComponent {
  final String title = "Tour of Heroes";
}