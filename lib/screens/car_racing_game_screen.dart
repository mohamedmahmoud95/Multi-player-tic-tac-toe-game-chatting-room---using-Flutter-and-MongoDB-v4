import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../main.dart';
import '../models/gift.dart';
import '../models/player.dart';
import '../widgets/car_widget.dart';
import 'chat_screen/group_chat_screen.dart';

class CarRacingGameScreen extends StatefulWidget {
  const CarRacingGameScreen({Key? key}) : super(key: key);

  @override
  State<CarRacingGameScreen> createState() => _CarRacingGameScreenState();
}

class _CarRacingGameScreenState extends State<CarRacingGameScreen> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    cars = [car, car2,];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GroupChatScreen()));
                },
                icon: const Icon(Icons.chat_bubble)),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        drawer: Drawer(
          width: 200,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

            Card(
              child: ListTile(
                title: const Text('Restart', style: TextStyle(fontSize: 20),),
                trailing: const Icon(Icons.restart_alt),
                onTap: () {
                  startGame();
                },
              ),
            ),


            Card(
              child: ListTile(
                title: const Text('LogOut', style: TextStyle(fontSize: 20),),
                trailing: const Icon(Icons.logout),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ]),
        ),

        body: Center(
          child: Container(
            color: Colors.white10,
            height: height - 50,
            width: width ,
            child: Stack(
              children: [



                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      ...cars.map((car) => Expanded(
                        child: SizedBox(
                          child: Column(
                            children: [
                              const Divider(color: Colors.grey, thickness: 1,),

                              Text(car.player.nickname!, style: const TextStyle(color: Colors.black, overflow: TextOverflow.clip),),
                              Text("${car.player.score}", style: const TextStyle(color: Colors.black, fontSize: 20),),
                              const Divider(color: Colors.grey, thickness: 1,),

                            ],
                          ),

                        ),
                      )).toList(),
                    ],

                  ),

                ),


                ...cars.map(
                      (car) => Positioned(
                    left: car.player.left,
                    top: car.player.top,
                    child: GestureDetector(
                      onPanUpdate: (newPosition) {
                        setState(() {
                          if (car.player.isMe!)
                          {
                            car.player.left =
                                max(0, car.player.left! + newPosition.delta.dx);
                            if (car.player.left! > width-100) {
                              car.player.left = width-100;
                            }
                            car.player.top =
                                max(0, car.player.top! + newPosition.delta.dy);
                            if (car.player.top! > height) {
                              car.player.top = height;
                            }
                            //  updatePlayerPositions(); //to avoid collision
                          }
                        });
                      },
                      child: car,
                    ),
                  ),
                ),

                ...gifts.map(
                      (gift) => Positioned(
                    left: gift.left,
                    top: gift.top,
                    child: Container(
                      width: gift.size,
                      height: gift.size,
                      child: gift.isThreat
                          ? Image.asset('assets/threat.png')
                          : Image.asset('assets/health.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Player player = Player(
    nickname: 'Mohamed',
    left: 300,
    top: 500,
    score: 0,
    playerNo: 1,
    socketID: '',
    points: 0,
    playerType: '',
    isMe: true,
  );
  Player player2 = Player(
    nickname: 'Mohamed',
    left: 200,
    top: 500,
    score: 0,
    playerNo: 2,
    socketID: '',
    points: 0,
    playerType: '',
    isMe: false,
  );
  late CarWidget car, car2;


  List<Gift> gifts = [];
  List<CarWidget> cars = [];

  late Timer timer;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    car = CarWidget(player: player);
    car2 = CarWidget(player: player2);
    gifts = [];

    timer = Timer.periodic(const Duration(milliseconds: 16), (Timer timer) {
      setState(() {
        // Update gift positions
        for (int i = 0; i < gifts.length; i++) {
          gifts[i].top += 5;

          if (checkCollision(gifts[i])) {
            if (gifts[i].isThreat) {
              player.score =  (player.score! - 10); // Decrease score for threats
            } else {
              player.score =  (player.score! + 10); // Increase score for gifts
            }

            gifts.removeAt(i);
            break;
          }

          if (gifts[i].top > 800) {
            gifts.removeAt(i);
          }
        }

        // Add new gifts randomly
        if (Random().nextInt(100) < 2) {
          double left = Random().nextInt(400).toDouble();
          double size = 40 + Random().nextInt(41).toDouble();
          bool isThreat = Random().nextBool();
          gifts.add(Gift(left: left-100, top: 0, size: size, isThreat: isThreat));
        }
      });

      // Check game over condition
      if (player.score! < 0) {
        timer.cancel();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Game Over'),
              content: const Text('Your score is negative!'),
              actions: [
                TextButton(
                  onPressed: () {
                    player.score = 0;
                    Navigator.of(context).pop();
                    startGame();
                  },
                  child: const Text('Restart'),
                ),
              ],
            );
          },


        );
      }


      // Check game winning condition
      if (player.score! > 200 ) {
        timer.cancel();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Yaaay'),
              content: const Text('We have a winner!'),
              actions: [
                TextButton(
                  onPressed: () {
                    player.score = 0;
                    Navigator.of(context).pop();
                    startGame();
                  },
                  child: const Text('Restart'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  bool checkCollision(Gift gift) {
    double carLeft = car.player.left!;
    double carTop = car.player.top!;
    double carSize = 120;

    if (gift.left + gift.size >= carLeft && gift.left <= carLeft + carSize) {
      if (gift.top >= carTop && gift.top <= carTop + carSize) {
        return true;
      }
    }

    return false;
  }

  bool checkPlayerCollision(Player player1, Player player2) {
    double player1Left = player1.left!;
    double player1Top = player1.top!;
    double player2Left = player2.left!;
    double player2Top = player2.top!;
    double carSize = 120;

    if (player1Left + carSize >= player2Left && player1Left <= player2Left + carSize) {
      if (player1Top + carSize >= player2Top && player1Top <= player2Top + carSize) {
        return true;
      }
    }

    return false;
  }

  void updatePlayerPositions() {
    if (checkPlayerCollision(player, player2)) {
      // Move player 2 away if collision occurs
      player.left = player2.left! + 75;
      player.top = player2.top! + 75;
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

}
