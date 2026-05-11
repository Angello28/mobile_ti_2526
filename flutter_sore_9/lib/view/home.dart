import 'package:flutter/material.dart';
import 'package:flutter_sore_6/controller/buku_provider.dart';
import 'package:flutter_sore_6/view/tambah_buku.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    BukuProvider bukuProvider = Provider.of<BukuProvider>(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: Text("Jumlah buku: ${bukuProvider.daftarBuku.length}"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: bukuProvider.daftarBuku.isEmpty
            ? Center(child: Text("Belum ada buku untuk saat ini"))
            : ListView.builder(
                itemCount: bukuProvider.daftarBuku.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(bukuProvider.daftarBuku[index].judul),
                    subtitle: Text(bukuProvider.daftarBuku[index].penulis),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  bukuProvider.daftarBuku[index].sampulBuku))),
                    ),
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => TambahBuku()));
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
    );
  }
}
