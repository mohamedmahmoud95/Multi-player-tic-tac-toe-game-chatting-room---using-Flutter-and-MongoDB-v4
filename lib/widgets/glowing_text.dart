import 'package:flutter/material.dart';

class GlowingText extends StatelessWidget {
  final String text;
  const GlowingText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        shadows: [
          Shadow(
            blurRadius: 30,
            color: Colors.blue,
          )
        ],
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 70,
      ),
    );
  }
}
