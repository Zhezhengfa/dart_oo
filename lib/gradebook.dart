import 'student.dart';
mixin Logger {
  void log(String msg) => print('[$runtimeType] $msg');
}
class GradeBook with Logger {
  final List<Student> _students;
  GradeBook(List<Student> students) : _students = students;
  double average() {
    if (_students.isEmpty) return 0;
    final sum = _students.fold<double>(0, (pre, s) => pre + s.score);
    return sum / _students.length;
  }
  Student? maxBy() {
    if (_students.isEmpty) return null;
    return _students.fold<Student?>(null, (max, s) {
      if (max == null) return s;
      return s.score > max.score ? s : max;
    });
  }
  int countPassed() {
    return _students.where((s) => s.passed).length;
  }
  Map<String, List<Student>> groupByGrade() {
    return {
      "优秀": _students.where((s) => s.score >= 85).toList(),
      "良好": _students.where((s) => s.score >= 70 && s.score < 85).toList(),
      "中等": _students.where((s) => s.score >= 60 && s.score < 70).toList(),
      "不及格": _students.where((s) => s.score < 60).toList(),
    };
  }
}
