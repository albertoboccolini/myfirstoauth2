import 'package:flutter_test/flutter_test.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:myfirstoauth2/myfirstoauth2.dart';

void main() {
  test('create object', () {
    var myFirstGoogleClient =
        MyFirstGoogleClient("", "", [""], Uri.parse(""), 8080);
    expect(myFirstGoogleClient.googleClientId, isA<String>());
    expect(myFirstGoogleClient.googleClientSecret, isA<String>());
    expect(myFirstGoogleClient.googleScopes, isA<List<String>>());
    expect(myFirstGoogleClient.redirectUrl, isA<Uri>());
    expect(myFirstGoogleClient.listenPort, isA<int>());
  });
  test('get an AutoRefreshingAuthClient', () {
    var myFirstGoogleClient =
        MyFirstGoogleClient("", "", [""], Uri.parse(""), 8080);
    expect(myFirstGoogleClient.createGoogleClient(),
        isA<Future<AutoRefreshingAuthClient>>());
  });
}
