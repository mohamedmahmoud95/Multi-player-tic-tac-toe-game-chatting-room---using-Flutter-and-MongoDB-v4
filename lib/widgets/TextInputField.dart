import 'package:flutter/material.dart';

import '../constants/project_colors.dart';
import '../main.dart';
import '../responsive/responsive.dart';


class TextInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const TextInputField(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
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
        child: TextFormField(
          controller: widget.controller,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          obscureText: false,
          cursorColor: Colors.white,
          cursorWidth: 2,
          cursorHeight: 18,
          textAlign: TextAlign.center,
          textInputAction: TextInputAction.next,

          onFieldSubmitted: (value) {
            setState(() {
              widget.controller.text = value;
            });
            debugPrint("entered value: $value");
          },
          decoration: InputDecoration(
            //  contentPadding: EdgeInsets.all(18),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 0.5, color: backgroundColor),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 1, color: Colors.blue),
            ),

            fillColor: backgroundColor,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.white),
            // labelText: "Password",
          ),
        ),
      ),
    );
  }
}
