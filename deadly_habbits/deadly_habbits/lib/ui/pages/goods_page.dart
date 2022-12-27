import 'package:deadly_habbits/ui/widgets/good_card.dart';
import 'package:flutter/material.dart';

import '../../models/good.dart';

class GoodsPage extends StatelessWidget {
  const GoodsPage(this.sum, {Key? key}) : super(key: key);

  final double sum;

  final List<Good> goods = const [
    Good(assetPath: 'assets/images/kovr.jpeg', name: 'Коврик для мыши', price: 308),
    Good(assetPath: 'assets/images/tochilka.jpeg', name: 'Точилка механическая', price: 189),
    Good(assetPath: 'assets/images/noch.jpeg', name: 'Ночник-проектор', price: 506),
    Good(assetPath: 'assets/images/kopil.jpeg', name: 'Копилка сейф электронная', price: 1199),
    Good(assetPath: 'assets/images/gantel.jpeg', name: 'Набор гантели разборной', price: 4500),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Куда бы вы могли потратить деньги'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        label: const Text('Назад'),
        icon: const Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                'Вы тратите на вредные привычки $sum рублей в день, ${sum * 30} в месяц, и ${sum * 365} в год! Представляете, как это много?',
                style: Theme.of(context).textTheme.headline5?.copyWith(),
              ),
              const SizedBox(height: 10),
              Text(
                'Вот что можно было бы приобрести за потраченные на вредные привычки деньги всего за месяц',
                style: Theme.of(context).textTheme.headline5?.copyWith(),
              ),
              const Divider(),
              Wrap(
                children: List.generate(goods.length, (i) => GoodCard(good: goods[i])),
              ),
              const SizedBox(height: 200),

              const Divider(),
              const SizedBox(height: 200),

              Text(
                'Итого: 6702 / ' + (sum * 30).toString() + ' рублей. Может быть хоть это повод задуматься?',
                style: Theme.of(context).textTheme.headline5?.copyWith(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
