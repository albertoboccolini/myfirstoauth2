import 'package:github/github.dart';
import 'package:http/http.dart';

String _gitHubBaseUrl = "https://api.github.com";

class GitHubClient {
  final GitHub client;

  GitHubClient(this.client);

  /// Return all organization repositories.
  ///
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#list-organization-repositories
  Future<Response> getOrgRepos(String organization) {
    return client.client.get(
        Uri.parse("$_gitHubBaseUrl/orgs/$organization/repos"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Create a repository for an organization.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#create-an-organization-repository
  Future<Response> createOrgRepo(String organization, Object? body) {
    return client.client.post(
        Uri.parse("$_gitHubBaseUrl/orgs/$organization/repos"),
        body: body,
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Return a repository.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#get-a-repository
  Future<Response> getRepo(String owner, String repository) {
    return client.client.get(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Updates a repository.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#update-a-repository
  Future<Response> updateRepo(
      String owner, String repository, Object? body) async {
    return client.client.patch(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository"),
        body: body,
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Delete a repository.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#delete-a-repository
  Future<Response> deleteRepo(String owner, String repository) {
    return client.client.delete(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Return all repository activities.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#list-repository-activities
  Future<Response> listRepoActivities(String owner, String repository) {
    return client.client.get(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/activity"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Check if automated security fixes are enabled for a repository.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#check-if-automated-security-fixes-are-enabled-for-a-repository
  Future<Response> checkAutomatedSecurityFixes(String owner, String repository){
    return client.client.get(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/automated-security-fixes"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Enable automated security fixes for a repository.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#enable-automated-security-fixes
  Future<Response> enableAutomatedSecurityFixes(String owner, String repository){
    return client.client.put(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/automated-security-fixes"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Disable automated security fixes for a repository.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#disable-automated-security-fixes
  Future<Response> disableAutomatedSecurityFixes(String owner, String repository){
    return client.client.delete(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/automated-security-fixes"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// List any syntax errors that are detected in the CODEOWNERS file.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#list-codeowners-errors
  Future<Response> listCodeOwnersErrors(String owner, String repository){
    return client.client.get(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/codeowners/errors"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Return all repository contributors.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#list-repository-contributors
  Future<Response> listRepoContributors(String owner, String repository) {
    return client.client.get(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/contributors"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Trigger a webhook event called repository_dispatch
  /// when you want activity that happens outside of GitHub
  /// to trigger a GitHub Actions workflow or GitHub App webhook.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#create-a-repository-dispatch-event
  Future<Response> createDispatchEvent(String owner, String repository, Object? body) {
    return client.client.post(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/dispatches"),
        body: body,
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Return all repository languages.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#list-repository-languages
  Future<Response> listRepoLanguages(String owner, String repository) {
    return client.client.get(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/languages"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Enables private vulnerability reporting for a repository.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#enable-private-vulnerability-reporting-for-a-repository
  Future<Response> enablePrivateVulnerabilityReporting(String owner, String repository) {
    return client.client.put(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/private-vulnerability-reporting"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Disables private vulnerability reporting for a repository.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#disable-private-vulnerability-reporting-for-a-repository
  Future<Response> disablePrivateVulnerabilityReporting(String owner, String repository) {
    return client.client.delete(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/private-vulnerability-reporting"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }
  /// Return all repository tags.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#list-repository-tags
  Future<Response> listRepoTags(String owner, String repository) {
    return client.client.get(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/tags"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Return all repository teams.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#list-repository-teams
  Future<Response> listRepoTeams(String owner, String repository) {
    return client.client.get(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/teams"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Return all repository topics.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#list-repository-topics
  Future<Response> getRepoTopics(String owner, String repository) {
    return client.client.get(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/topics"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Replaces all repository topics.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#replace-all-repository-topics
  Future<Response> replaceRepoTopics(String owner, String repository, Object? body) {
    return client.client.put(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/topics"),
        body: body,
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Transfer a repository.
  /// A transfer request will need to be accepted
  /// by the new owner when transferring a personal
  /// repository to another user.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#transfer-a-repository
  Future<Response> transferRepo(String owner, String repository, Object? body) {
    return client.client.post(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/transfer"),
        body: body,
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Check if vulnerability alerts are enabled for a repository.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#check-if-vulnerability-alerts-are-enabled-for-a-repository
  Future<Response> checkVulnerabilityAlerts(String owner, String repository) {
    return client.client.get(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/vulnerability-alerts"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Enables if vulnerability alerts are enabled for a repository.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#enable-vulnerability-alerts
  Future<Response> enableVulnerabilityAlerts(String owner, String repository) {
    return client.client.put(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/vulnerability-alerts"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Disables if vulnerability alerts are enabled for a repository.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#disable-vulnerability-alerts
  Future<Response> disableVulnerabilityAlerts(String owner, String repository) {
    return client.client.delete(
        Uri.parse("$_gitHubBaseUrl/repos/$owner/$repository/vulnerability-alerts"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Creates a new repository using a repository template.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#create-a-repository-using-a-template
  Future<Response> createRepoFromTemplate(String templateOwner, String templateRepository, Object? body) {
    return client.client.post(
        Uri.parse("$_gitHubBaseUrl/repos/$templateOwner/$templateRepository/generate"),
        body: body,
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Return all public repositories.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#list-repositories-for-the-authenticated-user
  Future<Response> listPublicRepos() {
    return client.client.get(Uri.parse("$_gitHubBaseUrl/repositories"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Return all repositories for the authenticated user.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#list-repositories-for-the-authenticated-user
  Future<Response> listReposForAuthUser() {
    return client.client.get(Uri.parse("$_gitHubBaseUrl/user/repos"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Creates a repository for the authenticated user.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#create-a-repository-for-the-authenticated-user
  Future<Response> createRepo(Object? body) async {
    return client.client.post(Uri.parse("$_gitHubBaseUrl/user/repos"),
        body: body,
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }

  /// Return all repositories for a user.
  ///
  /// GitHub App Permissions: https://docs.github.com/en/rest/overview/permissions-required-for-github-apps
  ///
  /// API docs: https://docs.github.com/en/rest/repos/repos#list-repositories-for-a-user
  Future<Response> listRepos(String owner) {
    return client.client.get(Uri.parse("$_gitHubBaseUrl/users/$owner/repos"),
        headers: {"Authorization": client.auth.authorizationHeaderValue()!});
  }
}
