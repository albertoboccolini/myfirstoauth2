import 'package:flutter/material.dart';

class GoogleButton extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final String iconUrl;
  final VoidCallback onPressed;

  const GoogleButton({
    Key? key,
    this.height = 50.0,
    this.width = 300.0,
    this.title = "Sign-in with Google",
    this.iconUrl =
        "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
    required this.onPressed,
  }) : super(key: key);

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffffffff),
                    foregroundColor: const Color(0xff24292E),
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
                  ),
                ),
                onPressed: widget.onPressed,
                label: Text(
                    style: const TextStyle(color: Colors.black),
                    widget.title))));
  }
}
