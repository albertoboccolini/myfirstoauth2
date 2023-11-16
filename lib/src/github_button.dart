import 'package:flutter/material.dart';

class GitHubButton extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final String iconUrl;
  final bool darkMode;
  final VoidCallback? onPressed;

  const GitHubButton({
    super.key,
    this.height = 50.0,
    this.width = 300.0,
    this.title = "Sign-in with GitHub",
    this.iconUrl =
        "https://icons.veryicon.com/png/o/miscellaneous/mirror-icon/github-65.png",
    this.darkMode = false,
    required this.onPressed,
  });

  @override
  State<GitHubButton> createState() => _GitHubButtonState();
}

class _GitHubButtonState extends State<GitHubButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: (widget.darkMode == false
                        ? Colors.white
                        : const Color(0xff24292E)),
                    foregroundColor: (widget.darkMode == false
                        ? const Color(0xff24292E)
                        : const Color(0xffffffff)),
                    disabledBackgroundColor:
                        const Color(0xffffffff).withOpacity(0.7)),
                icon: Container(
                  margin: const EdgeInsets.only(
                    left: 0,
                    right: 10,
                  ),
                  child: Image.network(
                    width: 36,
                    height: 36,
                    widget.iconUrl,
                    filterQuality: FilterQuality.medium,
                    color: (widget.darkMode == false
                        ? Colors.black
                        : Colors.white),
                  ),
                ),
                onPressed: widget.onPressed,
                label: Text(
                    style: TextStyle(
                        color: (widget.darkMode == false
                            ? Colors.black
                            : Colors.white)),
                    widget.title))));
  }
}
