import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  static const List<Item> items = [
    Item(name: 'Gula Pasir', price: 15000),
    Item(name: 'Minyak Goreng', price: 18000),
    Item(name: 'Tepung Terigu', price: 12000),
    Item(name: 'Kopi Bubuk', price: 25000),
    Item(name: 'Susu UHT', price: 16000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Barang')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(height: 0),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: Hero(
              tag: item.name,
              child: const CircleAvatar(child: Icon(Icons.shopping_bag)),
            ),
            title: Text(item.name),
            subtitle: Text('Rp ${item.price}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/item',
                arguments: item, // kirim objek Item
              );
            },
          );
        },
      ),
    );
  }
}
