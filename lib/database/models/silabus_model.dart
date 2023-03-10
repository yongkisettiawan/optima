class TabelSilabus {
  static const String tableName = 'tabelsilabus';

  int? silabusId;
  String? modul;
  String? tugas;
  bool? status;
  int? kelasId;

  TabelSilabus({
    this.silabusId,
    this.modul,
    this.tugas,
    this.status,
    this.kelasId,
  });

  Map<String, dynamic> toMap() {
    return {
      'silabusId': silabusId,
      'modul': modul,
      'tugas': tugas,
      'status': status == true ? 1 : 0,
      'kelasId': kelasId,
    };
  }

  static TabelSilabus fromMap(Map<String, dynamic> map) {
    return TabelSilabus(
      silabusId: map['silabusId'],
      modul: map['modul'],
      tugas: map['tugas'],
      status: map['status'] == 1,
      kelasId: map['kelasId'],
    );
  }
}
