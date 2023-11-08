[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![pub package](https://img.shields.io/badge/pub-v0.0.1-blue)](https://pub.dev/packages/myfirstoauth2) [![package publisher](https://img.shields.io/badge/publisher-albertoboccolini-blue)](https://pub.dev/packages/myfirstoauth2/publisher)

A flutter package for beginners to easly authenticate via OAuth2 using OAuth2 packages and making authorized HTTP requests with the user's OAuth2 credentials.
## About myfirstoauth2

myfirstoauth2 is designed to provide a simple and intuitive OAuth2 authentication solution for beginners. It simplifies the authentication process by integrating seamlessly with OAuth2 packages, making it easier for developers new to Flutter to implement secure authentication mechanisms. With this package you can easily set up OAuth2 authentication in your Flutter applications, allowing your users to securely log in to their accounts and services, all while maintaining a smooth and intuitive user experience.

Additionally, it offers a range of pre-built widgets for creating OAuth login buttons, making it even more convenient to implement social login functionality and improve the user onboarding experience in your Flutter projects.
## MyFirstGoogleClient (Getting Started)

To get started, set up your Google Cloud project and get the following information:

- `googleClientId`: The Client ID provided by the Google Cloud development console for your project.
- `googleClientSecret`: The Client Secret provided by the Google Cloud development console for your project.
- `googleScopes`: A list of strings representing the **[access scopes](https://developers.google.com/identity/protocols/oauth2/scopes)** needed for your specific use case.
- `redirectUrl`: The authorized redirect URL specified in your Google project settings.
- `listenPort`: The port on the local server will listen for OAuth2 redirection.

## Dependencies

```yaml
  url_launcher: ^6.2.1
  googleapis: ^11.4.0
  googleapis_auth: ^1.4.1
```
## Usage

```dart

import 'package:flutter/material.dart';
import 'package:myfirstoauth2/myfirstoauth2.dart';

class MyFirstOauth2Example extends StatelessWidget {
  const MyFirstOauth2Example({Key? key}) : super(key: key);

  Future<void> _authWithMyFirstOauth2() async {
    // creates a new MyFirstGoogleClient object
    // with the parameters entered by the user
    // and provides access to the createGoogleClient method.
    MyFirstGoogleClient myFirstGoogleClientObject = MyFirstGoogleClient(
        "googleClientId",
        "googleClientSecret",
        ["googleScope1", "googleScope2", ...],
        Uri.parse("http://localhost"),
        8080);
    // the method createGoogleClient return an
    // AutoRefreshingAuthClient which allows
    // to easly make HTTP requests to Google APIs using
    // the Google Client methods and which automatically
    // handle the renewal of credentials using the refresh_token.
    var myFirstGoogleClient =
        await myFirstGoogleClientObject.createGoogleClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const MyFirstGoogleButton(
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

**created by [albertoboccolini](https://github.com/albertoboccolini).**