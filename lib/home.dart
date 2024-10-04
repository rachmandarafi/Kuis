import 'package:flutter/material.dart';
import 'login.dart';
import 'daftar_barang_dummy.dart';

class HomePage extends StatefulWidget {
  final String username;

  HomePage({Key? key, required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Welcome, ${widget.username}!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                        "Butuh Bantuan? Klik untuk pergi ke halaman Panduan dan Dukungan"))),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Space between columns
                  mainAxisSpacing: 10, // Space between rows
                  childAspectRatio:
                      3 / 2, // Adjust the aspect ratio to fit images better
                ),
                itemCount: supermarketItemList.length,
                itemBuilder: (context, index) {
                  final SupermarketItem barang = supermarketItemList[index];
                  return Card(
                    elevation: 4,
                    color: const Color.fromARGB(255, 83, 200, 255),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network(
                            barang.imageUrls[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          barang.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(barang.price),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
