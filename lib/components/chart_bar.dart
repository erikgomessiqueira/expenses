import 'package:expenses/components/progress_bar.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  const ChartBar({
    super.key,
    required this.label,
    required this.percentage,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: constraints.maxHeight * .15,
            child: FittedBox(
              child: Text(value.toStringAsFixed(2)),
            ),
          ),
          SizedBox(height: constraints.maxHeight * .05),
          ProgressBar(percentage: percentage),
          SizedBox(height: constraints.maxHeight * .05),
          SizedBox(
            height: constraints.maxHeight * .15,
            child: FittedBox(child: Text(label)),
          ),
        ],
      );
    });
  }
}
