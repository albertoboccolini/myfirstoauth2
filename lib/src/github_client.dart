import 'package:github/github.dart';
import 'package:http/http.dart';

String _gitHubBaseUrl = "https://api.github.com";

class GitHubClient {
  final GitHub client;

  GitHubClient(this.client);

  Future<Response> getRepo(String owner, String repository) {
    return client.client
        .get(Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository"));
  }
}
