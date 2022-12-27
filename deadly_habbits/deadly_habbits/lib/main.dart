import 'package:deadly_habbits/models/habit.dart';
import 'package:deadly_habbits/ui/pages/goods_page.dart';
import 'package:deadly_habbits/ui/pages/habit_dialog.dart';
import 'package:deadly_habbits/ui/widgets/habit_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Трекер вредных привычек',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Трекер вредных привычек'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Habit> habits = <Habit>[
    Habit(
        title: 'Курение',
        countTitle: 'Сколько вы курите в день',
        unitTitle: 'Цена на пачку сигарет',
        icon: Icons.smoking_rooms),
    Habit(
        title: 'Кофе / Энергетики',
        countTitle: 'Сколько вы выпиваете в день',
        unitTitle: 'Цена на стакан кофе / банку энергетика',
        icon: Icons.coffee),
    Habit(
        title: 'Алкоголь',
        countTitle: 'Сколько вы выпиваете таких в день',
        unitTitle: 'Цена на порцию алкоголя',
        icon: Icons.local_drink),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                Text(
                  'Вредные привычки – термин, характеризующий такой образ жизни, при котором человек осознанно наносит вред своему здоровью, занимаясь определёнными вещами, приносящими приятные ощущения. Зачастую многим подобным зависимостям личность не придает серьезного значения, считая их проявлением собственной натуры',
                  style: Theme.of(context).textTheme.headline5?.copyWith(),
                ),
                const Divider(),
                const SizedBox(height: 10),

                SizedBox(
                  height: 810,
                  width: 1000,
                  child: ListView.builder(
                      itemCount: habits.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: HabitCard(
                            updateData: (h) {
                              setState(() {
                                habits[i] = h;
                              });
                            },
                            habit: Habit(
                                title: habits[i].title,
                                countTitle: habits[i].countTitle,
                                unitTitle: habits[i].unitTitle,
                                icon: habits[i].icon),
                          ),
                        );
                      }),
                ),

                // const HabitCard(
                //   habit: Habit(title: 'Курение', countTitle: 'Сколько вы курите в день', unitTitle: 'Цена на пачку сигарет', icon: Icons.smoking_rooms),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const HabitCard(
                //   habit: Habit(title: 'Кофе / Энергетики', countTitle: 'Сколько вы выпиваете в день', unitTitle: 'Цена на стакан кофе / банку энергетика', icon: Icons.coffee),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const HabitCard(
                //   habit: Habit(title: 'Алкоголь', countTitle: 'Сколько вы выпиваете таких в день', unitTitle: 'Цена на порцию алкоголя', icon: Icons.local_drink),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: const Size(300, 50), //////// HERE
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => GoodsPage(countDaily())),
                    );
                  },
                  child: const Text('Подсчитать'),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => HabitDialog(
                    onSubmitted: (Habit habit) {
                      setState(() {
                        habits.add(habit);
                      });
                    },
                  ));
        },
        label: const Text('Добавить вредную привычку'),
        icon: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  double countDaily() {
    double sum = 0;

    for (Habit h in habits) {
      print(h.unitPrice);
      print(h.count);
      sum += h.dayEconomy;
    }

    print(sum);
    return sum;
  }
}
