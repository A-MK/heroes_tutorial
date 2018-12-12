import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'heroes_list/heroes_list_component.template.dart' as heroes_list_template;
import 'dashboard/dashboard_component.template.dart' as dashboard_template;
import 'hero_detail/hero_detail_component.template.dart' as hero_detail_template;
import 'page_not_found/page_not_found_component.template.dart' as page_not_found_template;
export 'route_paths.dart';

class Routes {
  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: heroes_list_template.HeroesListComponentNgFactory,
  );
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
    // useAsDefault: true,
  );
  static final hero = RouteDefinition(
    routePath: RoutePaths.hero,
    component: hero_detail_template.HeroDetailComponentNgFactory,
  );
  static final all = <RouteDefinition>[
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
    heroes,
    dashboard,
    hero,
    RouteDefinition(
      path: '.+',
      component: page_not_found_template.PageNotFoundComponentNgFactory,
    ),
  ];
}
