import '../lib/student_p.dart';
import '../lib/gradebook_p.dart';
void main() {
  final studentData = [
    StudentP("01", "小红", 88),
    StudentP("02", "小绿", 58),
    StudentP("03", "小蓝", 72),
    StudentP("04", "小黄", 66),
  ];
  final gb = GradeBookP(studentData);
  gb.printReport(studentData);
  print("平均分：${gb.average()}");
  print("及格人数：${gb.countPassed()}");
  gb.complexStats();
}
