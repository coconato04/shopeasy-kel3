import 'package:flutter/material.dart';

import '../component/rootappbar.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  // ignore: prefer_final_fields
  TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  void _onSearchTextChanged(String value) {
    setState(() {
      _searchResults = _performSearch(value);
    });
  }

  List<String> _performSearch(String value) {
    // Implementasi logika pencarian di sini, misalnya mengambil data dari API atau database
    // dan mengembalikan hasil pencarian dalam bentuk List<String>
    List<String> results = [];
    // Contoh hasil pencarian statis
    if (value.isNotEmpty) {
      for (int i = 1; i <= 10; i++) {
        results.add("Hasil Pencarian $i untuk '$value'");
      }
    }
    return results;
  }

  void _onCancelPressed() {
    Navigator.pop(context); // Kembali ke halaman sebelumnya
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const rootappbar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchTextChanged,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_searchResults[index]),
                  onTap: () {
                    // Implementasi aksi saat item di klik
                    // Misalnya, menampilkan detail item atau melakukan navigasi ke halaman detail
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              elevation: 0.0,
              onPressed: _onCancelPressed,
              backgroundColor: Colors.transparent,
              child: const Icon(
                Icons.cancel_outlined,
                size: 40.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
