import 'package:flutter/material.dart';

import '../../models/habit.dart';

class HabitCard extends StatefulWidget {
  const HabitCard({Key? key, required this.habit}) : super(key: key);

  final Habit habit;

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 800
          ),
          child: Column(
            children: [
              Text(widget.habit.title, style: Theme.of(context).textTheme.headline6?.copyWith()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    widget.habit.icon,
                    size: 200,
                  ),
                  // const SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.habit.unitTitle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const SizedBox(
                              width: 300,
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '210 руб.',
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                widget.habit.countTitle,

                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const SizedBox(
                              width: 300,
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '10',
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Align(
                          child: Column(
                            children: [
                              Text(
                                'Вы бы могли сэкономить ${widget.habit.dayEconomy} за день',
                              ),
                              Text(
                                'Вы бы могли сэкономить ${widget.habit.monthEconomy} за месяц',
                              ),
                              Text(
                                'Вы бы могли сэкономить ${widget.habit.yearEconomy} за год',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
