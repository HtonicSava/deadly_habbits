import 'package:deadly_habbits/models/good.dart';
import 'package:flutter/material.dart';

class GoodCard extends StatelessWidget {
  const GoodCard({Key? key, required this.good}) : super(key: key);
  final Good good;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ConstrainedBox(constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200),child: Image.asset(good.assetPath)),
            const SizedBox(
              height: 4,
            ),
            Text(
              good.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '${good.price}₽',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
