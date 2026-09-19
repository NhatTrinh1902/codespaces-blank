void main() {
  var diem = 8.5;
  final monHoc = 'Dart & Flutter';
  const soTinChi = 3;
  String? ghiChu;

  print('Mon: $monHoc ($soTinChi tin chi) - Diem: $diem');
  print('Ghi chu: ${ghiChu ?? "khong co"}');
}