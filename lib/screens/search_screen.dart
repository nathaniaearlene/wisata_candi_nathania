import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Candi> _filteredCandis = candiList;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pencarian Candi')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Cari Candi',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                setState(() {
                  _filteredCandis = candiList
                      .where((candi) =>
                          candi.name.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredCandis.length,
                itemBuilder: (context, index) {
                  final candi = _filteredCandis[index];
                  return Card(
                    child: ListTile(
                      title: Text(candi.name),
                      subtitle: Text(candi.location),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
