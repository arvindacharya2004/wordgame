// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:wordgame/database/Repository.dart';

class secondpagestless extends StatelessWidget {
  const secondpagestless({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: secondpage(),
    );
  }
}

class secondpage extends StatefulWidget {
  const secondpage({super.key});

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  TextEditingController controller1 = TextEditingController();
  String? question = "                 All the best";
  String? actual_answer;
  int num = 0;
  int score = 0;
  int hscore = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final result = await dbhelper().getquestion_gk();
    final resultint = await dbhelper().readint('finalvalue_gk');
    final resultscore = await dbhelper().score("matchscore_gk");
    final resulthighscore = await dbhelper().highscore("totalscore_gk");
    // Database access logic (use MyDbHelper or similar)
    // Replace with your logic

    setState(() {
      question = result!["question"];
      actual_answer = result["answer"];
      num = resultint!["id"];
      score = resultscore!["score"];
      hscore = resulthighscore!["score"];
    });
  }

  update() async {
    increment = (num + 1);
    if (increment == 101) {
      increment = 1;
    }
    int win = 0;
    if (life == 3) {
      win = 3000;
    } else if (life == 2) {
      win = 2000;
    } else {
      win = 1000;
    }
    await dbhelper().updateid(increment, 'finalvalue_gk');
    score = score + win;
    await dbhelper().updatescore(score, 'matchscore_gk');
    int win1 = 0;
    if (hscore < score)
      win1 = score;
    else {
      win1 = hscore;
    }
    await dbhelper().updatehighscore(win1, 'totalscore_gk');
  }

  updatehighscore() async {
    await dbhelper().updatescore(0, 'matchscore_gk');
  }

  Color boxcolor = Colors.white;
  int color = 0;
  String input_answer = "";
  String word = "";
  String chances = "";
  String loweranswer = "";
  int life = 4;
  int increment_score = 0;
  int increment = 0;
  bool dashed = true;
  @override
  Widget build(BuildContext context) {
    setState(() {
      controller1.clear();
      List l1 = [];
      int templife = life;
      int len = 0;
      if (actual_answer != null) {
        if (dashed) {
          for (int i = 0; i < actual_answer!.length; i++) {
            if (actual_answer![i] == ' ') {
              word = "$word ";
            } else {
              word = "${word}_";
            }
          }
        }
        loweranswer = actual_answer!.toLowerCase();
        input_answer = input_answer.toLowerCase();
        dashed = false;
        l1 = word.split("");
        len = actual_answer!.length;
        for (int i = 0; i < len; i++) {
          if (loweranswer[i] == input_answer) {
            l1[i] = actual_answer![i];
          }

          if (l1[i] == "_") {
            continue;
          }
          word = l1.join("");
        }
      }
      if (input_answer != " ") {
        int n = 0;
        for (int i = 0; i < len; i++) {
          if (loweranswer[i] == input_answer) {
            n = 1;
          }
        }

        if (n == 0) {
          if (chances == word) {
            life--;
          }
        }
      }
      chances = word;

      if (color == 1) {
        if (templife == life) {
          boxcolor = Colors.green;
        } else {
          boxcolor = Colors.red;
        }
      }
    });

    Widget Won_dialogue_box(BuildContext context) {
      update();

      return SizedBox(
        height: 1000,
        width: 500,
        child: SimpleDialog(
          children: [
            SizedBox(
              height: 250,
              width: 500,
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'Correct ✅',
                      style: TextStyle(fontSize: 50, color: Colors.green),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 700,
                      height: 40,
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              width: 300,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text(
                                  word,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 315,
                      height: 75,
                      child: Center(
                        child: Row(
                          children: [
                            ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const secondpage()));
                                  // Replace with your actual route name
                                },
                                icon: const Icon(
                                  Icons.play_arrow_sharp,
                                  size: 65,
                                ),
                                label: const Text("Next")),
                            const SizedBox(
                              width: 8,
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.home,
                                  size: 65,
                                ),
                                label: const Text("Home")),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget lost_dialogue_box(BuildContext context) {
      updatehighscore();
      return SizedBox(
        height: 1000,
        width: 500,
        child: SimpleDialog(
          children: [
            SizedBox(
              height: 200,
              width: 500,
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'Wrong ❌',
                      style: TextStyle(fontSize: 45, color: Colors.red),
                    ),
                    const Text(
                      'Better luck next time :(',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.home,
                          size: 55,
                        ),
                        label: const Text("Home")),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("General Knowlege",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/gk_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              if (word == actual_answer)
                Won_dialogue_box(context)
              else if (life == 0)
                lost_dialogue_box(context)
              else
                Column(
                  children: [
                    const Text(""),
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "HighScore:$hscore",
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Pulse(
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Text(
                              "Level:$num",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Pulse(
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Text(
                              "Score:$score",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        if (life == 3)
                          Pulse(
                              child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: const Text(
                              "♥️♥️♥️",
                              style: TextStyle(color: Colors.red, fontSize: 23),
                            ),
                          ))
                        else if (life == 2)
                          Pulse(
                              child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: const Text(
                              "♥️♥️💔",
                              style: TextStyle(color: Colors.red, fontSize: 23),
                            ),
                          ))
                        else if (life == 1)
                          Pulse(
                              child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: const Text(
                              "♥️💔💔",
                              style: TextStyle(color: Colors.red, fontSize: 23),
                            ),
                          ))
                      ],
                    ),
                    const Text(""),
                    Container(
                      height: 180,
                      width: 370,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        children: [
                          const Text(
                            "Question",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: SizedBox(
                              width: 330,
                              child: Text(
                                '$question',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(""),
                    const Text(""),
                    Pulse(
                      child: Container(
                        height: 80,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: boxcolor,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextField(
                                cursorHeight: 0,
                                cursorWidth: 0,
                                controller: controller1,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      letterSpacing: 9),
                                  hintText: word,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    input_answer = value;
                                    input_answer = input_answer[0];
                                    color = 1;
                                  });
                                }),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
