import 'package:flutter/material.dart';
import '../model/buku_model.dart';

class BukuProvider extends ChangeNotifier {
  List<Buku> daftarBuku = [];

  void tambahBuku(Buku bukuBaru) {
    daftarBuku.add(bukuBaru);
    notifyListeners();
  }
}
