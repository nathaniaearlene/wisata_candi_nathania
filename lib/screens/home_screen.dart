import 'package:flutter/material.dart';
import '../data/candi_data.dart';
import '../models/candi.dart';
import '../widgets/item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 1 buat appBar dgn judul Wisata Candi
      appBar: AppBar(
        title: const Text('Wisata Candi'),
      ),
      // TODO: 2 buat body dgn GridView.builder
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        padding: const EdgeInsets.all(8),
        itemCount: candiList.length,
        itemBuilder: (context, index) {
          // TODO: 3 buat ItemCard sbg return value dari GridView.builder
          final Candi candi = candiList[index];
          return ItemCard(candi: candi);
        },
      ),
    );
  }
}
