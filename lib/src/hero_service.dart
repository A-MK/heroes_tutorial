import 'hero.dart';
import 'mock_heroes.dart';

class HeroService {
Future<List<Hero>> getAll() async => Future.delayed(Duration(seconds: 2), () => mockHeroes) ;
}