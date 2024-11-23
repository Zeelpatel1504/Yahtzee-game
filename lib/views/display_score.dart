import 'package:flutter/material.dart';
import '/models/scorecard.dart';

class ScoreCardDisplay extends StatelessWidget {
  final ScoreCard scoreCard;
  final Function(ScoreCategory) onCategorySelected;
  final List<ScoreCategory> leftCategories;
  final List<ScoreCategory> rightCategories;

  const ScoreCardDisplay({
    required this.scoreCard,
    required this.onCategorySelected,
    required this.leftCategories,
    required this.rightCategories,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // Left Categories (Ones, Twos, etc.)
            Expanded(
              child: Column(
                children: [
                  for (var index = 0; index < leftCategories.length; index++)
                    Container(
                      height: 45,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 0,
                      ),
                      child: ElevatedButton(
                        onPressed: scoreCard[leftCategories[index]] == null
                            ? () => onCategorySelected(leftCategories[index])
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: scoreCard[leftCategories[index]] != null
                              ? const Color.fromARGB(255, 195, 28, 111) // Dark pink when selected
                              : Colors.blue, // Blue when unselected
                        ),
                        child: Text(
                          '${leftCategories[index].name}: ${scoreCard[leftCategories[index]] ?? ''}',
                          style: const TextStyle(
                            color: Colors.black, // Ensure text is always black
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 10), // Adjust space between sections
            Container(
              width: 150,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 195, 28, 111), // Dark pink for score
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Score: ${scoreCard.total}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Black text for score
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Right Categories (Three of a Kind, Four of a Kind, etc.)
            Expanded(
              child: Column(
                children: [
                  for (var index = 0; index < rightCategories.length; index++)
                    Container(
                      height: 45,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 0,
                      ),
                      child: ElevatedButton(
                        onPressed: scoreCard[rightCategories[index]] == null
                            ? () => onCategorySelected(rightCategories[index])
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: scoreCard[rightCategories[index]] != null
                              ? const Color.fromARGB(255, 195, 28, 111) // Dark pink when selected
                              : Colors.blue, // Blue when unselected
                        ),
                        child: Text(
                          '${rightCategories[index].name}: ${scoreCard[rightCategories[index]] ?? ''}',
                          style: const TextStyle(
                            color: Colors.black, // Ensure text is always black
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
