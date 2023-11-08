# Version 1.0.0

## MyFirstGoogleClient

- Added the following properties to `MyFirstGoogleClient`:
  - `googleClientId`
  - `googleClientSecret`
  - `googleScopes`: A list of strings representing the **[access scopes](https://developers.google.com/identity/protocols/oauth2/scopes)** needed for your specific use case.
  - `redirectUrl`: The authorized redirect URL specified in your Google project settings.
  - `listenPort`: The port on the local server will listen for OAuth2 redirection.
- Added the `redirectFunction` method to handle OAuth2 redirection, including the "access_type=offline" parameter to request an OAuth2 token that includes `refresh_token`.
- Added `createGoogleClient` method to create a self-updating OAuth2 client using specified credentials and scopes.
## MyFirstGoogleButton

- Added the following properties to `MyFirstGoogleButton`:
  - `width`
  - `height`
  - `title`: the button text.
  - `iconUrl`: The URL of the Google icon to appear next to the text.
  - `onPressed`: The callback to execute when the button is pressed.
- Set default values ​​for `height`, `width`, `title`, and `iconUrl` properties if not specified.
- Added Google icon as an image taken from `iconUrl` or a default URL if not specified.
