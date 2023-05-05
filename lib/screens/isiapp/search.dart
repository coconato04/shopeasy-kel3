import 'package:flutter/material.dart';
import 'package:shopeasy/services/SearchService.dart';
import '../component/rootappbar.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  List<List<dynamic>> _searchResults = [];

  void _onSearchTextChanged(String value) async {
    if (value.isNotEmpty) {
      List<List<dynamic>> results = await SearchService().searchProducts(value);
      print(
          'Search results: ${results.toString()}'); // Add this line to print search results
      setState(() {
        _searchResults = results;
      });
    } else {
      setState(() {
        _searchResults = [];
      });
    }
  }

  void _onCancelPressed() {
    Navigator.pop(context);
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
                  title: Text(_searchResults[index][0].toString()),
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
