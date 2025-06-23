import 'dart:math';

import 'package:card_play/src/home_view.dart';
import 'package:flutter/material.dart';

class CardGameWidget extends StatefulWidget {
  final List<String> initCards;
  const CardGameWidget({super.key, required this.initCards});

  @override
  State<CardGameWidget> createState() => _CardGameWidgetState();
}

class _CardGameWidgetState extends State<CardGameWidget> {
  
  bool isGameStart = false;
  List<String> gameCards = [];
  late Size cardSize;

  @override
  void initState() {
    super.initState();
    // print('initState');
  }

  @override
  void didChangeDependencies() {
    // print('didChangeDependencies');
    super.didChangeDependencies();
    cardSize = Size(MediaQuery.of(context).size.width / 7 - 10, 70);
  }

  void getCard() {
    if (gameCards.length == 7) isGameStart = false;
    if (!isGameStart) return;
    var index = Random().nextInt(HomeView.cardList.length);
    var card = HomeView.cardList[index];
    gameCards.add(card);
    update();
  }
  void update() => setState(() {});

  @override
  void didUpdateWidget(CardGameWidget oldWidget) {
    // print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initCards != widget.initCards) {
      gameCards = [...widget.initCards];
      isGameStart = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            gameCards.length,
            (index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: cardSize.width,
                height: cardSize.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 211, 211, 211),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Text(gameCards[index]),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: getCard,
          child: const Text('카드받기'),
        )
      ],
    );
  }
}