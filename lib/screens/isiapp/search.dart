import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 45),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchTextChanged,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
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
            padding: EdgeInsets.all(20.0),
            child: FloatingActionButton(
              elevation: 0.0,
              onPressed: _onCancelPressed,
              child: Icon(
                Icons.cancel_outlined,
                size: 40.0,
                color: Colors.black,
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
