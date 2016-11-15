// Copyright (c) 2016, . All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:angular2/core.dart';
import 'hero.dart';
import 'hero_component_detail.dart';
import 'package:angular2/router.dart';
import 'mock_heros.dart';
import 'HeroService.dart';

/// [HeroDetailComponent],
@Component(
    selector: 'my-heroes',
    styleUrls: const ['heroes_component.css'],
    templateUrl: 'heroes_component.html')

class HeroesComponent implements OnInit{
  final HeroService _heroService;
  final Router _router;
  List<Hero> heroes;
  HeroesComponent(this._heroService, this._router);

  Hero selectedHero;

  onSelect(Hero h){
    selectedHero = h;
  }

  Future<Null> getHeros() async {
    heroes = await _heroService.getHeroes();
  }

  @override
  ngOnInit() {
    getHeros();
  }

  Future<Null>goToDetail() => _router.navigate(['HeroDetail', {'id':selectedHero.id}]);

  Future<Null> add(String name) async {
    name = name.trim();
    if (name.isEmpty)
      return;

    heroes.add(await _heroService.create(name));
  }

  Future<Null> delete(hero) async {
    await _heroService.delete(hero.id);
    heroes.remove(hero);
    if(selectedHero == hero)
      selectedHero = null;
  }
}
