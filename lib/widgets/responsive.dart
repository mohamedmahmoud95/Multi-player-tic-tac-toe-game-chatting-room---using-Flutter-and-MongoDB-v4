import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  final Widget child;
  const Responsive({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 1.2,
          maxWidth: 600,
        ),
        child: child,
      ),
    );
  }
}
