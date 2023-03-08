class TabelSilabus {
  int? silabusId;
  String? modul;
  String? tugas;
  bool? status;

  TabelSilabus({
    this.silabusId,
    this.modul,
    this.tugas,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'silabusId': silabusId,
      'modul': modul,
      'tugas': tugas,
      'status': status == true ? 1 : 0,
    };
  }

  static TabelSilabus fromMap(Map<String, dynamic> map) {
    return TabelSilabus(
      silabusId: map['silabusId'],
      modul: map['modul'],
      tugas: map['tugas'],
      status: map['status'] == 1,
    );
  }
}
