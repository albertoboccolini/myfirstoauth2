import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFirstGoogleClient {
  final String googleClientId;
  final String googleClientSecret;
  final List<String> googleScopes;
  final Uri redirectUrl;
  final int listenPort;

  MyFirstGoogleClient(
    this.googleClientId,
    this.googleClientSecret,
    this.googleScopes,
    this.redirectUrl,
    this.listenPort,
  );

  Future<bool> redirectFunction(redirectUrl) async {
    if (await canLaunchUrl(Uri.parse("$redirectUrl&access_type=offline"))) {
      return launchUrl(Uri.parse("$redirectUrl&access_type=offline"));
    }
    return false;
  }

  Future<AutoRefreshingAuthClient> createGoogleClient() async {
    var oauth2 = await clientViaUserConsent(
        ClientId(googleClientId, googleClientSecret),
        googleScopes,
        redirectFunction,
        listenPort: listenPort);
    return oauth2;
  }
}
