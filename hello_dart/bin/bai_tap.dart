import 'dart:io';

void main() {
  // Bài 1: năm nhuận
  print('2000: ${kiemTraNamNhuan(2000)}'); // true
  print('1900: ${kiemTraNamNhuan(1900)}'); // false
  print('2024: ${kiemTraNamNhuan(2024)}'); // true
  print('2023: ${kiemTraNamNhuan(2023)}'); // false

  // Bài 2: phân loại ký tự
  for (final c in ['a', 'b', '7', '#', 'E']) {
    print('$c -> ${phanLoaiKyTu(c)}');
  }

  // Bài 3: / và ~/
  print('7 / 2 = ${7 / 2}');     // 3.5
  print('7 ~/ 2 = ${7 ~/ 2}');   // 3
  print('-7 / 2 = ${-7 / 2}');   // -3.5
  print('-7 ~/ 2 = ${-7 ~/ 2}'); // -3

  // Bài 4: tam giác cân
  stdout.write('Nhap chieu cao tam giac: ');
  final h = int.tryParse(stdin.readLineSync() ?? '');
  if (h == null || h <= 0) {
    print('Chieu cao khong hop le');
    return;
  }
  for (var i = 1; i <= h; i++) {
    print(' ' * (h - i) + '*' * (2 * i - 1));
  }
}

bool kiemTraNamNhuan(int nam) {
  return (nam % 4 == 0 && nam % 100 != 0) || nam % 400 == 0;
}

String phanLoaiKyTu(String s) {
  if (s.isEmpty) return 'Khong hop le';
  final c = s[0].toLowerCase();
  switch (c) {
    case 'a' || 'e' || 'i' || 'o' || 'u':
      return 'Nguyen am';
    case var x when x.codeUnitAt(0) >= 97 && x.codeUnitAt(0) <= 122:
      return 'Phu am';
    case var x when x.codeUnitAt(0) >= 48 && x.codeUnitAt(0) <= 57:
      return 'Chu so';
    default:
      return 'Khac';
  }
}