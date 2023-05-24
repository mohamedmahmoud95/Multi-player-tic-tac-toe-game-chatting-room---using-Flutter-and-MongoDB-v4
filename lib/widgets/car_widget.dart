
import 'package:flutter/material.dart';

import '../models/player.dart';

class CarWidget extends StatefulWidget {
  final Player player;

  const CarWidget({Key? key, required this.player}) : super(key: key);

  @override
  State<CarWidget> createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 100,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('assets/car_${widget.player.playerNo!<5?widget.player.playerNo : 4}.png'),
          ),
          Text(widget.player.nickname!),
        //  Text("${widget.player.score}", style: const TextStyle(color: Colors.black),),

        ],
      ),
    );
  }
}