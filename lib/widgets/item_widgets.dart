import 'package:catelog_app/models/catelog.dart';
import 'package:flutter/material.dart';

class ItemWidgets extends StatelessWidget {
  // const ItemWidgets({Key? key}) : super(key: key);

  final Item item;

  const ItemWidgets({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print('${item.name} pressed');
        },
        leading: Image.network(item.image!),
        title: Text(item.name!),
        subtitle: Text(item.desc!),
        trailing: Text(
          '\$ ${item.price}',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.5,
        ),
      ),
    );
  }
}
