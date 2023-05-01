import 'package:flutter/material.dart';
import 'package:shopeasy/screens/isiapp/sales/registersales.dart';

class HomeStorePage extends StatefulWidget {
  final List<RegisterSales> stores;

  HomeStorePage({required this.stores});

  @override
  _HomeStorePageState createState() => _HomeStorePageState();
}

class _HomeStorePageState extends State<HomeStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Store'),
      ),
      body: widget.stores.isEmpty
          ? Center(
              child: Text('You haven\'t registered any stores yet.'),
            )
          : ListView.builder(
              itemCount: widget.stores.length,
              itemBuilder: (context, index) {
                final store = widget.stores[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: store.image != null
                        ? Image.file(store.image!)
                        : Image.asset('assets/icon/usericon.png'),
                    radius: 30,
                  ),
                  title: Text(store.name),
                  subtitle: Text(store.description),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Navigate to the store page with the selected store data
                    Navigator.pushNamed(
                      context,
                      '/store',
                      arguments: store,
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigate to the register store page
          Navigator.pushNamed(context, '/register_store');
        },
      ),
    );
  }
}
