import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('detail test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('go to Tabbar map', () async {
      SerializableFinder input = find.text('Annuaire');
      await driver.tap(input);
      SerializableFinder map = find.byValueKey('champ_recherche');
      await widgetExists(
        driver,
        map,
        timeout: const Duration(seconds: 1),
      );
      await driver.tap(map);
      SerializableFinder megan = find.text('BOWEN Megan');
      await widgetExists(
        driver,
        megan,
        timeout: const Duration(seconds: 5),
      );
      await driver.tap(megan);

      SerializableFinder hasService = find.text('Marketing');
      expect(
        await widgetExists(
          driver,
          hasService,
          timeout: const Duration(seconds: 5),
        ),
        true,
      );
    });
  });
}

Future<bool> widgetExists(
  FlutterDriver driver,
  SerializableFinder finder, {
  Duration timeout,
}) async {
  try {
    await driver.waitFor(finder, timeout: timeout);

    return true;
  } catch (_) {
    return false;
  }
}
