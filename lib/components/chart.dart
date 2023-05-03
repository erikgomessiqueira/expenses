import 'package:expenses/components/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/transactions.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart({super.key, required this.recentTransaction});

  List<Map<String, Object>> get groupedTrasactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        final transaction = recentTransaction[i];
        bool sameDay = transaction.date.day == weekDay.day;
        bool sameMonth = transaction.date.month == weekDay.month;
        bool sameYear = transaction.date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += transaction.value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  double get _weekTotalValue {
    return groupedTrasactions.fold(0, (previousValue, transaction) {
      return previousValue + (transaction['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTrasactions.map(
            (trasaction) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: trasaction['day'].toString(),
                  percentage: (trasaction['value'] as double) / _weekTotalValue,
                  value: double.parse(trasaction['value'].toString()),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
