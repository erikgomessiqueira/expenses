import 'dart:io';

import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:expenses/components/adaptative_text_field.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(
      {required String title,
      required double value,
      required DateTime date})? onSubmit;

  const TransactionForm({super.key, this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(TransactionForm oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (widget.onSubmit == null || title.isEmpty || value <= 0) return;

    widget.onSubmit!(
      title: title,
      value: value,
      date: _selectedDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: Platform.isIOS ? 0 : 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AdaptativeTextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                placeholder: 'Título',
              ),
              AdaptativeTextField(
                controller: _valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                placeholder: 'Valor (R\$ 0,00)',
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                      label: 'Nova transação', onPressed: _submitForm),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
