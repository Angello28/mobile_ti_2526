import 'package:flutter/material.dart';
import 'package:flutter_sore_6/controller/buku_provider.dart';
import 'package:flutter_sore_6/model/buku_model.dart';
import 'package:provider/provider.dart';

class TambahBuku extends StatelessWidget {
  TambahBuku({super.key});

  TextEditingController judulController = TextEditingController();
  TextEditingController penulisController = TextEditingController();
  TextEditingController sampulController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: Text("Tambah Buku"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: judulController,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Judul"),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: penulisController,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Penulis"),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: sampulController,
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Sampul Buku (URL)"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Provider.of<BukuProvider>(context, listen: false).tambahBuku(
                    Buku(
                        judul: judulController.text,
                        penulis: penulisController.text,
                        sampulBuku: sampulController.text));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text("${judulController.text} berhasil ditambahkan")));
                Navigator.of(context).pop();
              },
              child: Text("Tambah Buku"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
