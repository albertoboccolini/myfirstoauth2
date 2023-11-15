[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![pub package](https://img.shields.io/badge/pub-v1.0.1-blue)](https://pub.dev/packages/myfirstoauth2) [![package publisher](https://img.shields.io/badge/publisher-albertoboccolini-blue)](https://pub.dev/packages/myfirstoauth2/publisher)

A flutter package for beginners to easly authenticate via OAuth2 using OAuth2 packages and making authorized HTTP requests with the user's OAuth2 credentials.

![myfirstoauth2image](https://raw.githubusercontent.com/albertoboccolini/myfirstoauth2/main/images/myfirstoauth2.png)

## About myfirstoauth2

myfirstoauth2 is designed to provide a simple and intuitive OAuth2 clients solution for beginners. It simplifies the authentication process by integrating seamlessly with OAuth2 packages and offering clients with simple functions for using REST APIs, making it easier for developers new to Flutter to implement secure authentication mechanisms. With this package you can easily set up OAuth2 authentication in your Flutter applications, allowing your users to securely log in to their accounts and services, all while maintaining a smooth and intuitive user experience.

Additionally, it offers a range of pre-built widgets for creating OAuth login buttons, making it even more convenient to implement social login functionality and improve the user onboarding experience in your Flutter projects.
## Dependencies

```yaml
  url_launcher: ^6.2.1
  googleapis: ^11.4.0
  googleapis_auth: ^1.4.1
  github: ^9.19.0
  http: ^1.1.0
```
## Advice

It is highly advisable to utilize localhost with port 8080 in the "Redirect URL" field while generating application credentials on the API service side (such as Google Cloud, GitHub, etc.). This is due to the redirection process during OAuth2 creation, where the client will locally listen on that specific port to acquire the authentication code. Subsequently, the OAuth2 client creation function will redirect to the designated site specified as the "redirectUrl" parameter during object creation.
## Google Client (Getting Started)

To get started, set up your Google Cloud project and get the following information:

- `googleClientId`: The Client ID provided by the Google Cloud development console for your project.
- `googleClientSecret`: The Client Secret provided by the Google Cloud development console for your project.
- `googleScopes`: A list of strings representing the **[access scopes](https://developers.google.com/identity/protocols/oauth2/scopes)** needed for your specific use case.
## Usage

```dart

import 'package:flutter/material.dart';
import 'package:myfirstoauth2/myfirstoauth2.dart';

class MyFirstOauth2Example extends StatelessWidget {
  const MyFirstOauth2Example({Key? key}) : super(key: key);

  Future<void> _authWithMyFirstOauth2() async {
    // creates a new OAuth2 object
    // with the parameters entered by the user
    // and provides access to the createGoogleClient method.
    OAuth2 myFirstOAuth2 = OAuth2(
        "googleClientId",
        "googleClientSecret",
        ["googleScope1", "googleScope2", ...],
        Uri.parse("http://localhost"),
        8080);
    // the method createGoogleClient return an
    // istance of GoogleClient which allows
    // to easly make HTTP requests to Google APIs using
    // the Google Client methods and which automatically
    // handle the renewal of credentials using the refresh_token.
    GoogleClient myFirstGoogleClient =
        await myFirstOAuth2.createGoogleClient();
    var response =
        await myFirstGoogleClient.getDataset("PROJECT_NAME", "DATASET_NAME");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const GoogleButton(
          title: 'Log-in with Google',
          height: 300.0,
          width: 50.0,
          onPressed: _authWithMyFirstOauth2,
        ),
      ),
    );
  }
}
```
## GitHub Client (Getting Started)

To get started, set up your GitHub developer application and get the following information:

- `githubClientId`: The Client ID provided by the GitHub developer settings for your project.
- `githubClientSecret`: The Client Secret provided by the GitHub developer settings for your project.
- `githubScopes`: A list of strings representing the **[access scopes](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps)** needed for your specific use case.
## Usage

```dart

import 'package:flutter/material.dart';
import 'package:myfirstoauth2/myfirstoauth2.dart';

class MyFirstOauth2Example extends StatelessWidget {
  const MyFirstOauth2Example({Key? key}) : super(key: key);

  Future<void> _authWithMyFirstOauth2() async {
    // creates a new OAuth2 object
    // with the parameters entered by the user
    // and provides access to the createGitHubClient method.
    OAuth2 myFirstOAuth2 = OAuth2(
        "githubClientId",
        "githubClientSecret",
        ["githubScope1", "githubScope2", ...],
        Uri.parse("http://localhost"),
        8080);
    // the method createGitHubClient return an
    // istance of GitHubClient which allows
    // to easly make HTTP requests to GitHub APIs using
    // the GitHubClient methods.
    GitHubClient myFirstGoogleClient =
        await myFirstOAuth2.createGitHubClient();
    var response =
        await myFirstGoogleClient.getRepo("OWNER", "REPO_NAME");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const GitHubButton(
          title: 'Log-in with GitHub',
          height: 300.0,
          width: 50.0,
          darkMode: true,
          onPressed: _authWithMyFirstOauth2,
        ),
      ),
    );
  }
}
```

**created by [albertoboccolini](https://github.com/albertoboccolini).**