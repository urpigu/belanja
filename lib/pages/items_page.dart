import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/item.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  // Data contoh – sesuaikan bila perlu.
  static const List<Item> items = [
    Item(
      name: 'Kopi Arabica',
      price: 45000,
      stock: 12,
      rating: 4.7,
      image: 'assets/images/kopi_arabica.png',
    ),
    Item(
      name: 'Teh Melati',
      price: 20000,
      stock: 20,
      rating: 4.5,
      image: 'assets/images/teh_melati.png',
    ),
    Item(
      name: 'Madu Hutan',
      price: 60000,
      stock: 8,
      rating: 4.8,
      image: 'assets/images/madu_hutan.png',
    ),
    Item(
      name: 'Cokelat Bubuk',
      price: 35000,
      stock: 15,
      rating: 4.6,
      image: 'assets/images/cokelat_bubuk.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Belanja')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.78,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              key: Key('gridItem_${item.name}'),
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                // go_router: kirim data pakai `extra`
                context.push('/item', extra: item);
              },
              child: Card(
                elevation: 1,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'item-hero-${item.name}',
                        child: Image.asset(
                          item.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Rp ${item.price}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                item.rating.toString(),
                                style: const TextStyle(fontSize: 12),
                              ),
                              const Spacer(),
                              Text(
                                'Stok ${item.stock}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
