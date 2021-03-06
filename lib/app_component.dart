import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/routes.dart';
import 'src/hero_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [
    routerDirectives
  ],
  providers: [
    ClassProvider(HeroService)
  ],
  exports: [
    Routes,
    RoutePaths,
  ],
)
class AppComponent {
  final String title = "Tour of Heroes";
}