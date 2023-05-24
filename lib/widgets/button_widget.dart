import 'package:flutter/material.dart';

import '../responsive/responsive.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ButtonWidget({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width =
        MediaQuery.of(context).size.width; //max size of the used screen
    return Responsive(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.outer,
                blurRadius: 20,
                color: Colors.blue.shade900,
              ),
            ]),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: Size(width, 50),
            elevation: 2,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 15),
          ),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
