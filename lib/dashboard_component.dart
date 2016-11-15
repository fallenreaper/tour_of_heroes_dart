import 'dart:async';
import 'package:TestAngular2DartApp/HeroService.dart';
import 'package:TestAngular2DartApp/hero.dart';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'hero_search_component.dart';

@Component(
    selector: "my-dashboard",
    styleUrls: const ["dashboard_component.css"],
    templateUrl: 'dashboard_component.html',
    directives: const[HeroSearchComponent]
)
class DashboardComponent implements OnInit{
  List<Hero> heroes;
  final HeroService _heroService;
  final Router _router;

  DashboardComponent(this._heroService, this._router);

  Future<Null> ngOnInit() async {
    heroes = (await _heroService.getHeroes()).skip(1).take(4).toList();
  }

  goToDetail(Hero h){
    _router.navigate(["HeroDetail", {'id': h.id.toString()}]);
  }
}