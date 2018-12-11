import 'hero.dart';
import 'mock_heroes.dart';

class HeroService {
  // HeroService(){
  //   print('HeroService created');
  // }
// Future<List<Hero>> getAll() async => Future.delayed(Duration(seconds: 2), () => mockHeroes) ; // return after 2 sec delay
Future<List<Hero>> getAll() async => mockHeroes ;

Future<Hero> getHeroById(int id) async => (await getAll()).firstWhere((hero) => hero.id == id );
}