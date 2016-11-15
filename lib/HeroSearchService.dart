import 'dart:async';
import 'dart:convert';
import 'package:TestAngular2DartApp/hero.dart';
import 'package:angular2/core.dart';
import 'package:http/http.dart';


@Injectable()
class HeroSearchService {
  final Client _http;

  HeroSearchService(this._http);

  Future<List<Hero>> search(String name) async {
    try{
      final response = await _http.get('app/heroes/?name=$name');
      return _extractData(response).map((json)=> new Hero.fromJson(json)).toList();
    }catch(e){
      throw _handleError(e);
    }
  }

  dynamic _extractData( Response resp ) => JSON.decode(resp.body)["data"];

  Exception _handleError(e){
    print(e);
    return new Exception ('Server Error; cause: $e');
  }
}