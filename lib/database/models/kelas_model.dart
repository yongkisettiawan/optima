import 'package:optima/database/models/silabus_model.dart';

class TabelKelas {
  static const String tableName = 'tabelkelas';

  int? kelasId;
  String? namaKelas;
  int? jumlahSilabus;
  DateTime? createAt;
  DateTime? updateAt;
  bool? status;
  List<TabelSilabus>? silabus;

  TabelKelas({
    this.kelasId,
    this.namaKelas,
    this.jumlahSilabus,
    this.createAt,
    this.updateAt,
    this.status,
    this.silabus,
  });

  Map<String, dynamic> toMap() {
    return {
      'kelasId': kelasId,
      'namaKelas': namaKelas,
      'jumlahSilabus': jumlahSilabus,
      'createAt': createAt?.millisecondsSinceEpoch,
      'updateAt': updateAt?.millisecondsSinceEpoch,
      'status': status == true ? 1 : 0,
    };
  }

  static TabelKelas fromMap(Map<String, dynamic> map) {
    return TabelKelas(
      kelasId: map['kelasId'],
      namaKelas: map['namaKelas'],
      jumlahSilabus: map['jumlahSilabus'],
      createAt: map['createAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createAt'])
          : null,
      updateAt: map['updateAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updateAt'])
          : null,
      status: map['status'] == 1,
      silabus: [],
    );
  }
}
