import 'package:flutter_test/flutter_test.dart';

import 'package:myfirstoauth2/myfirstoauth2.dart';

void main() {
  test('create object', () {
    var myFirstGoogleButton = const MyFirstGoogleButton(
      onPressed: null,
    );
    expect(myFirstGoogleButton.width, double);
    expect(myFirstGoogleButton.height, double);
    expect(myFirstGoogleButton.onPressed, null);
  });
}
