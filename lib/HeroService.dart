
import 'dart:async';
import 'dart:convert';
import 'hero.dart';
import 'mock_heros.dart';
import 'package:angular2/core.dart';
import 'package:http/http.dart';


@Injectable()
class HeroService {
  static const _heroesUrl = "app/heroes";
  static final _headers = {"Content-Type":"application/json"};
  final Client _http;

  HeroService(this._http);

  Future<List<Hero>> getHeroes() async {
    try {
      print("Getting Heroes");
      final response = await _http.get(_heroesUrl);
      final heroes = _extractData(response)
          .map((value) => new Hero.fromJson(value))
          .toList();
      return heroes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Hero> update(Hero h) async {
    try{
      var url = '$_heroesUrl/${h.id}';
      final response = await _http.put(url, headers:_headers, body: JSON.encode(h));
      return new Hero.fromJson(_extractData(response));
    }catch(e){
      throw _handleError(e);
    }
  }

  Future<Hero> create(String name) async {
    try{
      final response = await _http.post(_heroesUrl, headers: _headers, body: JSON.encode({'name':name}));
      return new Hero.fromJson(_extractData(response));
    }catch(e){
      throw _handleError(e);
    }
  }

  Future<Null> delete(int heroId) async {
    try{
      await _http.delete("$_heroesUrl/$heroId", headers: _headers);
    }catch(e){
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => JSON.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return new Exception('Server error; cause: $e');
  }

  Future<List<Hero>> getHeroesSlowly () => new Future.delayed(const Duration(seconds: 2), getHeroes);

  Future<Hero> getHero(int id) async => (await getHeroes()).firstWhere((h)=>h.id == id);

}