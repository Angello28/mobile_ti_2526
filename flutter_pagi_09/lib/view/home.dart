import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/controller/buku_provider.dart';
import 'package:test_flutter/view/tambah_buku.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    BukuProvider bukuProvider = Provider.of<BukuProvider>(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange,
        title: Text("Jumlah Buku: ${bukuProvider.daftarBuku.length}"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: bukuProvider.daftarBuku.isEmpty
            ? const Center(
                child: Text("Belum ada buku yang ditambahkan"),
              )
            : ListView.builder(
                itemCount: bukuProvider.daftarBuku.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  bukuProvider.daftarBuku[index].sampul))),
                    ),
                    title: Text(bukuProvider.daftarBuku[index].judul),
                    subtitle: Text(bukuProvider.daftarBuku[index].pengarang),
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => TambahBuku()));
        },
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
