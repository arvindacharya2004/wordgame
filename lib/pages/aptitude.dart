import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../database/Repository.dart';

class kidsstless extends StatelessWidget {
  const kidsstless({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: aptitude(),
    );
  }
}

class aptitude extends StatefulWidget {
  const aptitude({super.key});

  @override
  State<aptitude> createState() => _kidsState();
}

class _kidsState extends State<aptitude> {
  TextEditingController controller1 = TextEditingController();
  String? question = "                 All the best";
  String? actual_answer;
  String? option_1 = "A";
  String? option_2 = "B";
  String? option_3 = "C";
  String? option_4 = "D";
  int num = 0;
  int score = 0;
  int hscore = 0;
  int _win = 0;
  int _lose = 0;
  int hintans = 0;
  int correct_ans = 0;
  Color color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  Color color4 = Colors.white;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final result = await dbhelper().getquestion_ap();
    final resultint = await dbhelper().readint('finalvalue_ap');
    final resultscore = await dbhelper().score("matchscore_ap");
    final resulthighscore = await dbhelper().highscore("totalscore_ap");
    final resultwin = await dbhelper().readint('win_ap');
    final resultlose = await dbhelper().readint('lose_ap');

    setState(() {
      question = result!["question"];
      actual_answer = result["answer"];
      option_1 = result["option_a"];
      option_2 = result["option_b"];
      option_3 = result["option_c"];
      option_4 = result["option_d"];
      num = resultint!["id"];
      score = resultscore!["score"];
      hscore = resulthighscore!["score"];
      _win = resultwin!["id"];
      _lose = resultlose!["id"];
    });
  }

  update() async {
    increment = (num + 1);
    if (increment == 101) {
      increment = 1;
    }
    await dbhelper().updateid(increment, 'finalvalue_ap');
    await dbhelper().updateid(_win + 1, 'win_ap');
    score = score + 1000;
    await dbhelper().updatescore(score, 'matchscore_ap');
    int win1 = 0;
    if (hscore < score)
      win1 = score;
    else {
      win1 = hscore;
    }
    await dbhelper().updatehighscore(win1, 'totalscore_ap');
  }

  updatehighscore() async {
    await dbhelper().updatescore(0, 'matchscore_ap');
    await dbhelper().updateid(_lose + 1, 'lose_ap');
    increment = (num + 1);
    if (increment == 101) {
      increment = 1;
    }
    await dbhelper().updateid(increment, 'finalvalue_ap');
  }

  int increment = 0;

  @override
  Widget build(BuildContext context) {
    if (actual_answer == option_1) {
      hintans = 1;
    } else if (actual_answer == option_2) {
      hintans = 2;
    } else if (actual_answer == option_3) {
      hintans = 3;
    } else {
      hintans = 4;
    }

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
                                  actual_answer!,
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
                                              const aptitude()));
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
              height: 250,
              width: 500,
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'Wrong ❌',
                      style: TextStyle(fontSize: 50, color: Colors.red),
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
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text(
                                  "Answer=$actual_answer!",
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
                                              const aptitude()));
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Aptitude Quiz",
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
              if (correct_ans == hintans)
                Won_dialogue_box(context)
              else if (correct_ans != 0 && correct_ans != hintans)
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
                          width: 15,
                        ),
                        Pulse(
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Text(
                              "Level:$num",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Pulse(
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Text(
                              "Score:$score",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Pulse(
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Text(
                              "👍🏿:$_win%",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Pulse(
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: Text(
                              "👎🏿:$_lose%",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
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
                                fontSize: 17,
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
                                  fontSize: 20,
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
                        child: SizedBox(
                      width: 300,
                      height: 55,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color>(color1),
                          ),
                          onPressed: () {
                            setState(() {
                              correct_ans = 1;
                            });
                          },
                          child: Text(
                            "$option_1",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87),
                          )),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Pulse(
                        child: SizedBox(
                      width: 300,
                      height: 55,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color>(color2),
                          ),
                          onPressed: () {
                            setState(() {
                              correct_ans = 2;
                            });
                          },
                          child: Text(
                            "$option_2",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87),
                          )),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Pulse(
                        child: SizedBox(
                      width: 300,
                      height: 55,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color>(color3),
                          ),
                          onPressed: () {
                            setState(() {
                              correct_ans = 3;
                            });
                          },
                          child: Text(
                            "$option_3",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87),
                          )),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Pulse(
                        child: SizedBox(
                      width: 300,
                      height: 55,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all<Color>(color4),
                          ),
                          onPressed: () {
                            setState(() {
                              correct_ans = 4;
                            });
                          },
                          child: Text(
                            "$option_4",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87),
                          )),
                    )),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
