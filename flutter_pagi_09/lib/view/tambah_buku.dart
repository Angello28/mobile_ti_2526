import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/controller/buku_provider.dart';
import 'package:test_flutter/model/buku_model.dart';

class TambahBuku extends StatelessWidget {
  TambahBuku({super.key});

  TextEditingController judulController = TextEditingController();
  TextEditingController pengarangController = TextEditingController();
  TextEditingController sampulController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange,
        title: const Text("Tambah Buku"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: judulController,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Judul Buku"),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: pengarangController,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Pengarang"),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: sampulController,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Sampul Buku (URL)"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<BukuProvider>(context, listen: false).tambahBuku(
                    Buku(
                        judul: judulController.text,
                        pengarang: pengarangController.text,
                        sampul: sampulController.text));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text("${judulController.text} berhasil ditambahkan")));
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange),
              child: const Text("Tambah Buku"),
            )
          ],
        ),
      ),
    );
  }
}
