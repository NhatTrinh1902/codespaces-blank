// ===== Lớp lỗi tự định nghĩa =====
class DiemKhongHopLeException implements Exception {
  final String message;
  DiemKhongHopLeException(this.message);
}

class DanhSachRongException implements Exception {
  final String message;
  DanhSachRongException(this.message);
}

void main() {
  // ===== Bước 1: hàm với các loại tham số =====
  print(gioiThieu('An'));
  print(gioiThieu('An', 'Nho'));
  print(tinhDiemTB(giuaKy: 7, cuoiKy: 8).toStringAsFixed(2));                // dùng heSoCK mặc định 0.6
  print(tinhDiemTB(giuaKy: 7, cuoiKy: 8, heSoCK: 0.5).toStringAsFixed(2));   // truyền heSoCK

  // ===== Bước 2: List<Map> =====
  final List<Map<String, dynamic>> sinhVien = [
    {'ten': 'An', 'diem': 8.5},
    {'ten': 'Binh', 'diem': 6.0},
    {'ten': 'Chi', 'diem': 9.2},
  ];

  for (final sv in sinhVien) {
    print('${sv['ten']}: ${sv['diem']}');
  }

  final diemCaoNhat = sinhVien
      .map((sv) => sv['diem'] as double)
      .reduce((a, b) => a > b ? a : b);
  print('Diem cao nhat: $diemCaoNhat');

  // Yêu cầu 3: lọc sinh viên giỏi
  final sinhVienGioi = sinhVien.where((sv) => sv['diem'] >= 8.0).toList();
  print('Sinh vien gioi: $sinhVienGioi');

  // ===== Bước 3: đếm tần suất =====
  demTanSuatChu('lap trinh dart va flutter');

  // ===== Bước 4: xử lý ngoại lệ =====
  print(xepLoaiAnToan(7));
  print(xepLoaiAnToan(3));
  print(xepLoaiAnToan(-2));
  print(xepLoaiAnToan(15));

  // ===== Bài tập cuối lab =====
  // Bài 1
  final ds = <num>[1, 2, 3.5];
  print('Tong (for): ${tinhTongList(ds)}');
  print('Tong (fold): ${ds.fold<num>(0, (a, b) => a + b)}');

  // Bài 2: Set các mức xếp loại không trùng
  final Set<String> cacXepLoai =
      sinhVien.map((sv) => xepLoai(sv['diem'] as double)).toSet();
  print('Cac xep loai: $cacXepLoai');

  // Bài 3: bắt lỗi danh sách rỗng
  try {
    print('Cao nhat: ${timDiemCaoNhat([5.0, 9.0, 7.5])}');
    print('Cao nhat: ${timDiemCaoNhat([])}');
  } on DanhSachRongException catch (e) {
    print('Loi: ${e.message}');
  }
}

// ---------- Bước 1 ----------
// Tham số vị trí bắt buộc + tùy chọn
String gioiThieu(String ten, [String? biDanh]) {
  if (biDanh == null) return 'Toi la $ten';
  return 'Toi la $ten, biet danh $biDanh';
}

// Tham số đặt tên, có giá trị mặc định
double tinhDiemTB({
  required double giuaKy,
  required double cuoiKy,
  double heSoCK = 0.6,
}) {
  return giuaKy * (1 - heSoCK) + cuoiKy * heSoCK;
}

// ---------- Bước 3 ----------
void demTanSuatChu(String cauVan) {
  final Map<String, int> tanSuat = {};
  for (final ky in cauVan.toLowerCase().split('')) {
    if (ky == ' ') continue;
    tanSuat[ky] = (tanSuat[ky] ?? 0) + 1;
  }
  tanSuat.forEach((k, v) => print('\'$k\' xuat hien $v lan'));
}

// ---------- Bước 4 ----------
String xepLoaiAnToan(double diem) {
  try {
    if (diem < 0 || diem > 10) {
      throw DiemKhongHopLeException('Diem $diem nam ngoai [0, 10]');
    }
    return diem >= 5 ? 'Dat' : 'Khong dat';
  } on DiemKhongHopLeException catch (e) {
    return 'Loi: ${e.message}';
  } finally {
    print('Da kiem tra xong diem $diem');
  }
}

// ---------- Bài tập cuối lab ----------
num tinhTongList(List<num> ds) {
  num tong = 0;
  for (final x in ds) {
    tong += x;
  }
  return tong;
}

// xepLoai chép từ Lab 2
String xepLoai(double diem) {
  if (diem >= 9.0) {
    return 'Xuat sac';
  } else if (diem >= 8.0) {
    return 'Gioi';
  } else if (diem >= 6.5) {
    return 'Kha';
  } else if (diem >= 5.0) {
    return 'Trung binh';
  } else {
    return 'Yeu';
  }
}

double timDiemCaoNhat(List<double> ds) {
  if (ds.isEmpty) {
    throw DanhSachRongException('Danh sach rong, khong tim duoc diem cao nhat');
  }
  return ds.reduce((a, b) => a > b ? a : b);
}