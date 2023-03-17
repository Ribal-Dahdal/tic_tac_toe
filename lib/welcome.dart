// ignore_for_file: prefer_const_constructors
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Text(
                  "TIC TAC TOE",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 255, 230, 0)),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: AvatarGlow(
                endRadius: 140,
                duration: Duration(seconds: 2),
                glowColor: Colors.white,
                repeat: true,
                repeatPauseDuration: Duration(seconds: 1),
                startDelay: Duration(seconds: 1),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                      ),
                      shape: BoxShape.circle),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[900],
                    child: Image.asset(
                      '/images/tictactoelogo.png',
                      color: Colors.white,
                      fit: BoxFit.scaleDown,
                    ),
                    radius: 80.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Text(
                  "@CREATEDBYRIBAL",
                  style: TextStyle(
                      fontSize: 10, color: Color.fromARGB(255, 255, 230, 0)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(30),
                    color: Color.fromARGB(255, 255, 230, 0),
                    child: Center(
                      child: Text(
                        'PLAY GAME',
                        // style: myNewFont,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
