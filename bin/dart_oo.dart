import '../lib/student.dart';
import '../lib/gradebook.dart';
void main() {
  final stuList = [
    Student('01', '李华', 92),
    Student('02', '王芳', 55),
    Student('03', '张明', 76),
    Student('04', '刘梅', 62),
  ];
  final book = GradeBook(stuList);
  print("平均分：${book.average()}");
  print("最高分学生：${book.maxBy()?.name}");
  print("及格人数：${book.countPassed()}");
  print("分档结果：${book.groupByGrade()}");
}
