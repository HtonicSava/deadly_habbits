import 'package:deadly_habbits/ui/widgets/good_card.dart';
import 'package:flutter/material.dart';

import '../../models/good.dart';

class GoodsPage extends StatelessWidget {
  const GoodsPage({Key? key}) : super(key: key);

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
              'Вот что можно было бы приобрести за потраченные на вредные привычки деньги',
              style: Theme.of(context).textTheme.headline5?.copyWith(),
            ),
            const Divider(),
              Wrap(children: List.generate(goods.length, (i) => GoodCard(good: goods[i])),)
          ],),
        ),
      ) ,
    );
  }
}
