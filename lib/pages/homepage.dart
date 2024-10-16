// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:wordgame/pages/aptitude.dart';
import 'package:wordgame/pages/gk.dart';
import 'package:animate_do/animate_do.dart';
import 'package:wordgame/pages/history.dart';
import 'package:wordgame/pages/sport.dart';
import 'package:wordgame/pages/technicalskill.dart';
import 'package:wordgame/pages/user.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("QUIZY",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => user()));
              },
              icon: Icon(
                Icons.account_circle_rounded,
                size: 50,
              ),
            )
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/gk_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Pulse(
                child: Container(
                  height: 125,
                  width: 370,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                    child: Text(
                      "Learn With fuN",
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Choose any one from below 👇🏻",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Center(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 260,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            'images/gk.png',
                            fit: BoxFit.fill,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => secondpage()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 170,
                        width: 260,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            'images/Aptitute.png',
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => aptitude()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 260,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            'images/technicalskill.jpg',
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ts2()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 170,
                        width: 260,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            'images/sports.png',
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => sport()));
                            // Your button action
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 170,
                        width: 260,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Image.asset(
                            'images/history.jpg',
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => history()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
