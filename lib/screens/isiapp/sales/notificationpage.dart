import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Page',
      debugShowCheckedModeBanner: false,
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('Promo'),
            subtitle: Text(
                'Favorit para warga, diskon hinga 500 ribu + cicilan 0% PLUS Gratis Ongkir dari shopeasy!'),
            trailing: Text('29 menit'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('[INFO] Kenaikan Biaya Admin'),
            subtitle: Text(
                'per 5 Mei, biaya admin isi saldo easypay akan naik. Selengkapnya >>'),
            trailing: Text('2 jam'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('Terima Kasih Sobat Shopeasy!'),
            subtitle: Text(
                'Bantu Shopeasy lebih baik dengan bagikan pengalaman belanjamu di sini!'),
            trailing: Text('8 jam'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('Ayo, Update Alamat Email-mu!'),
            subtitle: Text(
                'Hai, mau lacak status pesananmu & tahu tentang promo di Shopeasy? Isi alamat email-mu sekarang!'),
            trailing: Text('18 jam'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('GRATIS Ongkir Instant s/d 50RB!'),
            subtitle: Text('Gunakan pengiriman instan Gratis ongkir s/d 50RB'),
            trailing: Text('2 hari'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('Flash Sale'),
            subtitle:
                Text('Special flash sale hari buruh Iphone 14 hanya RP 1!!'),
            trailing: Text('3 hari'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('Info Keterlambatan Pesanan'),
            subtitle: Text(
                'Maaf, pesananmu mengalami keterlambatan karena adanya lonjakan pesanan. Mohon tunggu & cek status pesanan di aplikasi secara berkala.'),
            trailing: Text('3 hari'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('MAKIN UNTUNG'),
            subtitle: Text(
                'Sekarang transfer ke bank jadi GRATIS tanpa min TRANSAKSI! Yuk transfer sekarang'),
            trailing: Text('3 hari'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('PROMO'),
            subtitle: Text(
                'Product yang ada di dalam wishlist kamu sedang diskon loh!! buruan di checkout!!'),
            trailing: Text('4 hari'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('Pendapatmu sangat berarti untuk Shopeasy!'),
            subtitle: Text(
                'Kasih tau pengalamanmu supaya kualitas layanan kami jadi lebih baik. Langsung isi surveinya di sini!'),
            trailing: Text('5 hari'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('Minal Aidzin Walfaidzin'),
            subtitle: Text(
                'Kami segenap keluarga shop easy mengucapkan minal aidzin wal faidzin mohon maaf lahir dan batin'),
            trailing: Text('5 hari'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.notifications),
            ),
            title: Text('NIKMATI PROMONYA'),
            subtitle: Text(
                'Jangan sampai ketinggalan! shopeasy sedang bagi bagi berkah bagi kalian yang sedang menunggu berbuka puasa!'),
            trailing: Text('6 hari'),
            onTap: () {
              //TODO: Handle notification tap event
            },
          ),
        ],
      ),
    );
  }
}
