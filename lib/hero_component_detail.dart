import 'dart:async';
import 'package:TestAngular2DartApp/HeroService.dart';
import 'package:TestAngular2DartApp/hero.dart';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';

@Component(
    selector:"my-hero-detail",
    styleUrls: const ["hero_component_detail.css"],
    templateUrl: "hero_component_detail.html"
)
class HeroDetailComponent implements OnInit {
  @Input() Hero hero;
  final HeroService _heroService;
  final RouteParams _routeParams;
  final Location _location;
  HeroDetailComponent(this._heroService, this._routeParams, this._location);

  @override
  ngOnInit() async {
    var idString = _routeParams.get('id').toString();
    var id = int.parse(idString??"", onError: (_)=>null);
    if (id != null)
      hero = await _heroService.getHero(id);
  }

  goBack(){
    _location.back();
  }

  Future<Null> save() async {
    await _heroService.update(hero);
    goBack();
  }
}