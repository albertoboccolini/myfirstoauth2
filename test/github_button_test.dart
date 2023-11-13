import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myfirstoauth2/myfirstoauth2.dart';

void main() {
  test('create object', () {
    foo() {
      debugPrint("helloWorld");
    }

    var myFirstGitHubButton = GitHubButton(
      onPressed: foo,
    );
    expect(myFirstGitHubButton.width, isA<double>());
    expect(myFirstGitHubButton.height, isA<double>());
    expect(myFirstGitHubButton.title, isA<String>());
    expect(myFirstGitHubButton.iconUrl, isA<String>());
    expect(myFirstGitHubButton.darkMode, isA<bool>());
    expect(myFirstGitHubButton.onPressed, isA<VoidCallback>());
  });
}
