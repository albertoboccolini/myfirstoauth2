import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myfirstoauth2/myfirstoauth2.dart';

void main() {
  test('create object', () {
    foo() {
      debugPrint("helloWorld");
    }

    var myFirstGoogleButton = MyFirstGoogleButton(
      onPressed: foo,
    );
    expect(myFirstGoogleButton.width, isA<double>());
    expect(myFirstGoogleButton.height, isA<double>());
    expect(myFirstGoogleButton.onPressed, isA<VoidCallback>());
  });
}
