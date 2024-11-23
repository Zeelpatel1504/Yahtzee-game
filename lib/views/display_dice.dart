import 'package:flutter/material.dart';
import '../models/dice.dart';

class DiceDisplay extends StatelessWidget {
  final Dice dice;
  final List<int?> diceValues;
  final List<bool> heldDice;
  final Function(int) onHoldToggle;
  final int rollsLeft;

  const DiceDisplay({
    required this.dice,
    required this.diceValues,
    required this.heldDice,
    required this.onHoldToggle,
    required this.rollsLeft,
    Key? key,
  }) : super(key: key);


// Function to map dice value to image path
  String getDiceImage(int? value) {
    if (value == null) {
      return 'assets/images/empty.png'; // Placeholder for empty value
    }
    return 'assets/images/${value}one.png'; // Image names should match dice values
  }

  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 5; i++)
          GestureDetector(
            onTap: () {
              if (diceValues[i] != null) {
                onHoldToggle(i);
              }
            },
            child: Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: heldDice[i]
                    ? const Color.fromARGB(255, 222, 122, 211)
                    : Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Text(
                  rollsLeft == 3 ? ' ' : (diceValues[i]?.toString() ?? ' '),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
