import 'package:flutter/material.dart';
import 'package:flutter_sore_6/model/buku_model.dart';

class BukuProvider extends ChangeNotifier {
  List<Buku> daftarBuku = [];

  void tambahBuku(Buku bukuBaru) {
    daftarBuku.add(bukuBaru);
    notifyListeners();
  }
}
