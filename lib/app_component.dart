import 'package:TestAngular2DartApp/HeroService.dart';
import 'package:TestAngular2DartApp/dashboard_component.dart';
import 'package:TestAngular2DartApp/hero_component_detail.dart';
import 'package:TestAngular2DartApp/heroes_component.dart';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';




@Component(
    selector: "my-app",
    templateUrl: "app_component.html",
    styleUrls: const ['app_component.css'],
    directives: const [HeroDetailComponent, ROUTER_DIRECTIVES],
    providers: const [HeroService, ROUTER_PROVIDERS]
)

@RouteConfig(
    const [
      const Route(path: "/heroes", name: "Heroes", component: HeroesComponent),
      const Route(path: "/dashboard", name: "Dashboard", component: DashboardComponent, useAsDefault: true),
      const Route(path: '/detail/:id', name: "HeroDetail", component: HeroDetailComponent)
    ]
)

class AppComponent {
  String title = "Tour of Heroes";
}