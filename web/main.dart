// Copyright (c) 2016, . All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:TestAngular2DartApp/in_memory_data_service.dart';
import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:TestAngular2DartApp/app_component.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

main() {
  bootstrap(AppComponent, [provide(Client, useClass: InMemoryDataService)]);
}
