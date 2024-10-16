// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:wordgame/database/Repository.dart';

class userstless extends StatelessWidget {
  const userstless({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: user(),
    );
  }
}

class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  int hs_gk = 0;
  int lv_gk = 0;
  int hs_ap = 0;
  int lv_ap = 0;
  int w_ap = 0;
  int l_ap = 0;
  int hs_tq = 0;
  int lv_tq = 0;
  int hs_sq = 0;
  int lv_sq = 0;
  int hs_hq = 0;
  int lv_hq = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final hs_gk_ = await dbhelper().highscore("totalscore_gk");
    final lv_gk_ = await dbhelper().readint('finalvalue_gk');
    final hs_ap_ = await dbhelper().highscore("totalscore_ap");
    final lv_ap_ = await dbhelper().readint('finalvalue_ap');
    final w_ap_ = await dbhelper().readint('win_ap');
    final l_ap_ = await dbhelper().readint('lose_ap');
    final hs_tq_ = await dbhelper().highscore("totalscore_ts");
    final lv_tq_ = await dbhelper().readint('finalvalue_ts');
    final hs_sq_ = await dbhelper().highscore("totalscore_sq");
    final lv_sq_ = await dbhelper().readint('finalvalue_sq');
    final hs_hq_ = await dbhelper().highscore("totalscore_ht");
    final lv_hq_ = await dbhelper().readint('finalvalue_ht');

    setState(() {
      hs_gk = hs_gk_!["score"];
      lv_gk = lv_gk_!["id"];
      hs_ap = hs_ap_!["score"];
      lv_ap = lv_ap_!["id"];
      w_ap = w_ap_!["id"];
      l_ap = l_ap_!["id"];
      hs_tq = hs_tq_!["score"];
      lv_tq = lv_tq_!["id"];
      hs_sq = hs_sq_!["score"];
      lv_sq = lv_sq_!["id"];
      hs_hq = hs_hq_!["score"];
      lv_hq = lv_hq_!["id"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            )),
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
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(
                  Icons.account_circle,
                  size: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 450,
                width: 350,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: ListView(
                  children: [
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        children: [
                          const Text(
                            "General Knowledge",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Highscore",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Current Level",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 40,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$hs_gk",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$lv_gk",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 240,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        children: [
                          const Text(
                            "Aptitude Quiz",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Highscore",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Current Level",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 40,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$hs_ap",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$lv_ap",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 70,
                              ),
                              Text(
                                "Win%",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                width: 110,
                              ),
                              Text(
                                "lose%",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 40,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$w_ap",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$l_ap",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        children: [
                          const Text(
                            "Technical Quiz",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Highscore",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Current Level",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 40,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$hs_tq",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$lv_tq",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        children: [
                          const Text(
                            "Sports Quiz",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Highscore",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Current Level",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 40,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$hs_sq",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$lv_sq",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        children: [
                          const Text(
                            "History Quiz",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Highscore",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                "Current Level",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 40,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$hs_hq",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "$lv_hq",
                                  style: const TextStyle(
                                      color: Colors.black87, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
