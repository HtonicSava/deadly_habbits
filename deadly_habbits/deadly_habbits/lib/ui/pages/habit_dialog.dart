import 'package:flutter/material.dart';

import '../../models/habit.dart';

class HabitDialog extends StatefulWidget {
  const HabitDialog({Key? key, required this.onSubmitted})
      : super(key: key);
  final Function(Habit habit) onSubmitted;

  @override
  State<HabitDialog> createState() => _HabitDialogState();
}

class _HabitDialogState extends State<HabitDialog> {
  late final TextEditingController _unitTitleController;
  late final TextEditingController _countTitleController;
  late final TextEditingController _titleController;


  @override
  void initState() {
    super.initState();
    _unitTitleController = TextEditingController();
    _countTitleController = TextEditingController();
    _titleController = TextEditingController();

  }

  @override
  void dispose() {
    _unitTitleController.dispose();
    _countTitleController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Новая вредная привычка'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              hintText: 'Название',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: _unitTitleController,
            decoration: const InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              hintText: 'Заголовок для единоразовой траты',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: _countTitleController,
            decoration: const InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              hintText: 'Заголовок для дневной периодичности',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Отмена'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Добавить'),
          onPressed: () {
              widget.onSubmitted(
                  Habit(title: _titleController.text, countTitle: _countTitleController.text, unitTitle: _unitTitleController.text));
              Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
