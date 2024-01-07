# Version 1.0.3

## GitHubClient
- Added methods to call all `repositories` REST API endpoints.

# Version 1.0.2

## OAuth2

- Implemented OAuth2 authentication with Google and GitHub.
- Added functions to generate clients for Google and GitHub.
- Handling authorization request and exchanging authorization code to obtain access tokens.
- Added handling for the listening port for authorization requests.
## GitHubClient

- Added `GitHubClient` class to interact with the GitHub API.
- Implemented a function `getRepo` to retrieve repository information by owner and repository name.
- Utilizes the GitHub API endpoint to fetch repository details (`GET /repos/OWNER/REPO`).
## GitHubButton

- Introduced `GitHubButton` widget designed for implementing a GitHub Sign-In button in Flutter applications.
- Customizable properties include `width`, `height`, `title`, `iconUrl`, `darkMode`, and `onPressed` callback.
- Renders a button with GitHub's icon and customizable text, supporting both light and dark mode themes.
- Utilizes `ElevatedButton.icon` to create the button with an icon and text label.
- Provides default values for the button title, GitHub icon URL, and dark mode option for convenience.
- Supports an `onPressed` callback to handle button press actions.
## GoogleClient

- Introduced `GoogleClient` class facilitating interactions with the Google Cloud APIs.
- Implemented `getDataset` function to retrieve dataset information by project and dataset names.
- Utilizes the Google BigQuery API endpoint to fetch dataset details (`GET /projects/PROJECT/datasets/DATASET`).
## GoogleButton

- Updated `GoogleButton` widget to facilitate a Google Cloud Sign-In button in Flutter applications.
- Customizable properties include `width`, `height`, `title`, `iconUrl`, and `onPressed` callback.
- Utilizes `ElevatedButton.icon` to render a button with Google's icon and customizable text.
- Provides default values for the button title and Google icon URL for convenience.
- Supports an `onPressed` callback to handle button press actions.

# Version 1.0.1 (Retracted)

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
