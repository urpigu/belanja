import 'package:flutter/material.dart';
import '../models/item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'item-hero-${item.name}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    item.image,
                    width: 260,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(item.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Harga: Rp ${item.price}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text('Stok: ${item.stock}'),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, size: 18, color: Colors.amber),
                const SizedBox(width: 6),
                Text(item.rating.toString()),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Deskripsi singkat produk ${item.name}. '
              'Contoh detail untuk tugas Praktikum 2 (GridView, Hero, dan go_router).',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'A. A. Ngurah Sadhu Gunawan — 2341760168',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: Colors.grey[700]),
          ),
        ),
      ),
    );
  }
}
