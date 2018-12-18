import '../hero.dart';
import 'package:meta/meta.dart';

class AppState {
  final List<Hero> heroes;

  AppState({@required this.heroes});
  AppState.initialState(): 
  heroes = <Hero>[
  Hero(11, 'Mr. Nice'),
  Hero(12, 'Narco'),
  Hero(13, 'Bombasto'),
  Hero(14, 'Celeritas'),
  Hero(15, 'Magneta'),
  Hero(16, 'RubberMan'),
  Hero(17, 'Dynama'),
  Hero(18, 'Dr IQ'),
  Hero(19, 'Magma'),
  Hero(20, 'Tornado')
];
}