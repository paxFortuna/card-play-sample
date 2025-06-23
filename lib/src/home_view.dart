import 'dart:math';

import 'package:card_play/src/card_game.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static List<String> cardList = const [
    'A',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    'J',
    'Q',
    'K'
  ];
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int money = 400;
  List<String> initCards = List.unmodifiable([]);
  void makeInitCards() {
    if (money - 100 < 0) return;
    money -= 100;
    var cards = [];

    List.generate(1, (index) {
      var index = Random().nextInt(HomeView.cardList.length);
      var card = HomeView.cardList[index];
      cards.add(card);
    });
    initCards = List.unmodifiable([...cards]);
    update();
  }

  void update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$money원'),
        centerTitle: true,
      ),
      body: CardGameWidget(initCards: initCards),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 20,
          right: 20,
        ),
        child: Row(children: [
          Expanded(
            child: ElevatedButton(
              onPressed: makeInitCards,
              child: const Text('한판하기 -100원'),
            ),
          ),
        ]),
      ),
    );
  }
}