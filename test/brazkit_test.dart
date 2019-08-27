import 'package:flutter_test/flutter_test.dart';

import 'package:brazkit/BrazKit.dart';

void main() {
  test('test brazkit', () {
    final brazkit = BrazKit();
    expect(() => brazkit.print(null), throwsNoSuchMethodError);
  });
}
