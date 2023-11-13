import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myfirstoauth2/myfirstoauth2.dart';

void main() {
  test('create object', () {
    foo() {
      debugPrint("helloWorld");
    }

    var myFirstGoogleButton = GoogleButton(
      onPressed: foo,
    );
    expect(myFirstGoogleButton.width, isA<double>());
    expect(myFirstGoogleButton.height, isA<double>());
    expect(myFirstGoogleButton.title, isA<String>());
    expect(myFirstGoogleButton.iconUrl, isA<String>());
    expect(myFirstGoogleButton.onPressed, isA<VoidCallback>());
  });
}
