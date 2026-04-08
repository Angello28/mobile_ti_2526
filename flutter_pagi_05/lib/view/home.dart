import 'package:flutter/material.dart';
import 'package:flutter_pagi_05/listMakanan.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pemesanan Makanan"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: daftarMakanan.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                  title: Text(daftarMakanan[index].namaMakanan),
                  secondary: CircleAvatar(
                    backgroundImage:
                        NetworkImage(daftarMakanan[index].fotoMakanan),
                  ),
                  subtitle: Text("Rp. ${daftarMakanan[index].hargaMakanan}"),
                  value: daftarMakanan[index].isSelected,
                  onChanged: (e) {
                    setState(() {
                      daftarMakanan[index].changeSelected();
                    });
                  });
            }),
      ),
    );
  }
}
