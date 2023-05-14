import 'dart:math';

import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.onRemove,
  });

  final Transaction transaction;
  final void Function(String p1) onRemove;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();

    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: FittedBox(
              child: Text(
                "R\$${widget.transaction.value.toStringAsFixed(2)}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat('d MMM y').format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.error),
                label: Text(
                  'Excluir',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              )
            : IconButton(
                onPressed: () => widget.onRemove(widget.transaction.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );
  }
}
