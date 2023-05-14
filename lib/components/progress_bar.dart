import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double percentage;
  const ProgressBar({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: 10,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: const Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            FractionallySizedBox(
              heightFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
