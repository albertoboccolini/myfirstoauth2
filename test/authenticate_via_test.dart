import 'package:flutter_test/flutter_test.dart';
import 'package:myfirstoauth2/myfirstoauth2.dart';

void main() {
  var myFirstOAuth2Access = OAuth2("", "", [""], Uri.parse(""), 8080);
  TestWidgetsFlutterBinding.ensureInitialized();
  test('create object', () {
    expect(myFirstOAuth2Access.clientId, isA<String>());
    expect(myFirstOAuth2Access.clientSecret, isA<String>());
    expect(myFirstOAuth2Access.scopes, isA<List<String>>());
    expect(myFirstOAuth2Access.redirectUrl, isA<Uri>());
    expect(myFirstOAuth2Access.listenPort, isA<int>());
  });
  test('get an Istance of MyFirstGoogleClient', () {
    expect(
        myFirstOAuth2Access.createGoogleClient(), isA<Future<GoogleClient>>());
  });
  test('get an Istance of MyFirstGitHubClient', () {
    expect(
        myFirstOAuth2Access.createGitHubClient(), isA<Future<GitHubClient>>());
  });
}
