import 'package:flutter_test/flutter_test.dart';
import 'package:github/github.dart';
import 'package:http/http.dart';
import 'package:myfirstoauth2/myfirstoauth2.dart';

Future<void> main() async {
  // OAauth2 object with relative methods cannot
  // be used in tests for authentication.
  GitHub client = GitHub(auth: const Authentication.basic("", ""));
  GitHubClient githubClient = GitHubClient(client);

  test('get organization repository', () {
    expect(githubClient.getOrgRepos(client.auth.username!),
        isA<Future<Response>>());
  });

  test('create organization repository', () {
    final body = {
      "name": "hello-world",
      "description": "This is your first repository",
      "homepage": "https://github.com",
      "private": true,
    };
    expect(githubClient.createOrgRepo(client.auth.username!, body.toString()),
        isA<Future<Response>>());
  });

  test('get a repository', () {
    expect(githubClient.getRepo(client.auth.username!, "hello-world"),
        isA<Future<Response>>());
  });

  test('update a repository', () {
    final body = {
      "name": "hello-world",
      "description": "This is your first repository",
      "homepage": "https://github.com",
      "private": true,
    };
    expect(
        githubClient.updateRepo(
            client.auth.username!, "hello-world", body.toString()),
        isA<Future<Response>>());
  });

  test('delete a repository', () {
    expect(githubClient.deleteRepo(client.auth.username!, "hello-world"),
        isA<Future<Response>>());
  });

  test('get repository activities', () {
    expect(
        githubClient.listRepoActivities(client.auth.username!, "hello-world"),
        isA<Future<Response>>());
  });

  test('get repository contributors', () {
    expect(
        githubClient.listRepoContributors(client.auth.username!, "hello-world"),
        isA<Future<Response>>());
  });

  test('get repository languages', () {
    expect(githubClient.listRepoLanguages(client.auth.username!, "hello-world"),
        isA<Future<Response>>());
  });

  test('get repository tags', () {
    expect(githubClient.listRepoTags(client.auth.username!, "hello-world"),
        isA<Future<Response>>());
  });

  test('get repository teams', () {
    expect(githubClient.listRepoTeams(client.auth.username!, "hello-world"),
        isA<Future<Response>>());
  });

  test('get repository topics', () {
    expect(githubClient.listRepoTopics(client.auth.username!, "hello-world"),
        isA<Future<Response>>());
  });

  test('get public repositories', () {
    expect(githubClient.listPublicRepos(), isA<Future<Response>>());
  });

  test('get repositories for the authenticated user', () {
    expect(githubClient.listReposForAuthUser(), isA<Future<Response>>());
  });

  test('create a repository for the authenticated user', () {
    final body = {
      "name": "hello-world",
      "description": "This is your first repository",
      "homepage": "https://github.com",
      "private": true,
    };
    expect(githubClient.createRepo(body.toString()), isA<Future<Response>>());
  });

  test('get repositories for a user', () {
    expect(
        githubClient.listRepos(client.auth.username!), isA<Future<Response>>());
  });
}
