import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(
      {super.key, required this.transactions, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  "Nenhuma Trasação foi feita!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: constraints.maxHeight * .6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              var transaction = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(transaction),
                transaction: transaction,
                onRemove: onRemove,
              );
            },
          );
    // ListView(
    //     children: transactions.map((transaction) {
    //       return TransactionItem(
    //         key: ValueKey(transaction.id),
    //         transaction: transaction,
    //         onRemove: onRemove,
    //       );
    //     }).toList(),
    //   );
  }
}
