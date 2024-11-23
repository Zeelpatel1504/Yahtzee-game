import 'package:flutter/material.dart';
import 'views/yahtzee.dart';
import 'package:provider/provider.dart';
import 'models/dice.dart';
import 'models/scorecard.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ScoreCard>(
          create: (context) => ScoreCard(),
        ),
        Provider<Dice>(
          create: (context) => Dice(5),
        ),
      ],
      child: const MaterialApp(
        title: 'YAHTZEE',
        home: Scaffold(
          body: Yahtzee(),
        ),
      ),
    ),
  );
}
