import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function({required String title, required double value})? onSubmit;

  const TransactionForm({super.key, this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (widget.onSubmit == null || title.isEmpty || value <= 0) return;

    widget.onSubmit!(
      title: title,
      value: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: titleController,
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                decoration:
                    const InputDecoration(labelText: 'Valor (R\$ 0,00)'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _submitForm,
                    child: const Text(
                      'Nova Transação',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
