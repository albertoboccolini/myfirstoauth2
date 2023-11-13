import 'package:googleapis_auth/auth_io.dart';
import 'package:myfirstoauth2/myfirstoauth2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:github/github.dart';

class MyFirstOAuth2 {
  final String clientId;
  final String clientSecret;
  final List<String> scopes;
  final Uri redirectUrl;
  final int listenPort;

  MyFirstOAuth2(this.clientId, this.clientSecret, this.scopes, this.redirectUrl,
      this.listenPort);

  Future<String> _githubAuthRedirect(authUrl) async {
    final server = await HttpServer.bind("localhost", listenPort);
    launchUrl(Uri.parse("$authUrl"));
    final request = await server.first;
    request.response
      ..statusCode = 200
      ..headers.set('content-type', 'text/html; charset=UTF-8')
      ..redirect(redirectUrl);
    await request.response.close();
    return request.uri.queryParameters["code"]!;
  }

  Future<GitHubClient> createGitHubClient() async {
    final oauth2Flow = OAuth2Flow(clientId, clientSecret);
    final code = await _githubAuthRedirect(oauth2Flow.createAuthorizeUrl());
    final response = await oauth2Flow.exchange(code.toString());
    GitHub oauth2Client =
        GitHub(auth: Authentication.withToken(response.token));
    GitHubClient myFirstOAuth2Client = GitHubClient(oauth2Client);
    return myFirstOAuth2Client;
  }

  Future<bool> _googleAuthRedirect(authUrl) async {
    // adding the access_type=offline parameter
    // to the URL to request an OAuth2 token that includes refresh_token.
    return launchUrl(Uri.parse("$authUrl&access_type=offline"));
  }

  Future<GoogleClient> createGoogleClient() async {
    AutoRefreshingAuthClient oauth2Client = await clientViaUserConsent(
        ClientId(clientId, clientSecret), scopes, _googleAuthRedirect,
        listenPort: listenPort);
    GoogleClient myFirstOAuth2Client = GoogleClient(oauth2Client);
    return myFirstOAuth2Client;
  }
}
