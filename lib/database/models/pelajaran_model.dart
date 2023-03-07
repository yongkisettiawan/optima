import 'dart:convert';

class PelajaranModel {
  final int id;
  final String title;
  final List<String> silabus;
  final double jumlah;
  final String creatAt;
  final String updateAt;

  PelajaranModel({
    required this.id,
    required this.title,
    required this.silabus,
    required this.jumlah,
    required this.creatAt,
    required this.updateAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'silabus': jsonEncode(silabus), // konversi daftar ke JSON string
      'jumlah': jumlah,
      'creatAt': creatAt,
      'updateAt': updateAt,
    };
  }

  factory PelajaranModel.fromMap(Map<String, dynamic> map) {
    return PelajaranModel(
      id: map['id'],
      title: map['title'],
      silabus: List<String>.from(
          jsonDecode(map['silabus'])), // konversi JSON string ke daftar
      jumlah: map['jumlah'],
      creatAt: map['creatAt'],
      updateAt: map['updateAt'],
    );
  }
}
