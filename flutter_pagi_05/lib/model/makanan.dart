class Makanan {
  String namaMakanan;
  int hargaMakanan;
  String fotoMakanan;
  bool isSelected = false;

  Makanan(
      {required this.namaMakanan,
      required this.hargaMakanan,
      required this.fotoMakanan});

  void changeSelected() {
    isSelected = !isSelected;
  }
}
