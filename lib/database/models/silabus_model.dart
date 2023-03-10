class TabelSilabus {
  static const String tableName = 'tabelsilabus';

  int? silabusId;
  String? namaSilabus;
  int? kelasId;
  DateTime? createAt;
  DateTime? updateAt;
  bool? status;

  TabelSilabus({
    this.silabusId,
    this.namaSilabus,
    this.kelasId,
    this.createAt,
    this.updateAt,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'silabusId': silabusId,
      'namaSilabus': namaSilabus,
      'kelasId': kelasId,
      'createAt': createAt?.millisecondsSinceEpoch,
      'updateAt': updateAt?.millisecondsSinceEpoch,
      'status': status == true ? 1 : 0,
    };
  }

  static TabelSilabus fromMap(Map<String, dynamic> map) {
    return TabelSilabus(
      silabusId: map['silabusId'],
      namaSilabus: map['namaSilabus'],
      kelasId: map['kelasId'],
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
