class TabelKelas {
  int? kelasId;
  String? namaKelas;
  int? silabusId;
  int? jumlahSilabus;
  DateTime? createAt;
  DateTime? updateAt;
  bool? status;

  TabelKelas({
    this.kelasId,
    this.namaKelas,
    this.silabusId,
    this.jumlahSilabus,
    this.createAt,
    this.updateAt,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'kelasId': kelasId,
      'namaKelas': namaKelas,
      'silabusId': silabusId,
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
      silabusId: map['silabusId'],
      jumlahSilabus: map['jumlahSilabus'],
      createAt: map['createAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createAt'])
          : null,
      updateAt: map['updateAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updateAt'])
          : null,
      status: map['status'] == 1,
    );
  }
}
