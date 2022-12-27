import 'package:flutter/material.dart';

import '../../models/habit.dart';

class HabitCard extends StatefulWidget {
  const HabitCard({Key? key, required this.habit, required this.updateData}) : super(key: key);

  final Habit habit;
  final Function(Habit h) updateData;

  @override
  State<HabitCard> createState() => _HabitCardState(habit: habit);
}

class _HabitCardState extends State<HabitCard> {

  _HabitCardState({required this.habit});

  void recalculate() {
    try {
      habit.count = double.parse(countString ?? '0');
      habit.unitPrice = double.parse(unitPriceString ?? '0');

      widget.updateData(habit);
    } catch (e) {
    }
  }

  Habit habit;
  String? unitPriceString;
  String? countString;


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
                            SizedBox(
                              width: 300,
                              child: TextField(
                                onChanged: (String val) {
                                  setState(() {
                                    unitPriceString = val;
                                    recalculate();
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  suffix: Text('руб.')
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
                            SizedBox(
                              width: 300,
                              child: TextField(
                                onChanged: (String val) {
                                  setState(() {
                                    countString = val;
                                    recalculate();
                                  });

                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  suffix: Text('штук')
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
                                'Вы бы могли сэкономить ${habit.dayEconomy} за день',
                              ),
                              Text(
                                'Вы бы могли сэкономить ${habit.monthEconomy} за месяц',
                              ),
                              Text(
                                'Вы бы могли сэкономить ${habit.yearEconomy} за год',
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
