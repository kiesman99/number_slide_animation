import 'package:flutter_test/flutter_test.dart';

import 'package:number_slide_animation/number_slide_animation.dart';

void main() {
  test('try initializing with invalid number', () {
    expect(
        () => new NumberSlideAnimation(number: "hallo"), throwsAssertionError);
  });
}
