import 'student_p.dart';
mixin ReportPrinter {
  void printReport(List<StudentP> students) {
    final passCount = students.where((s) => s.passed).length;
    print("\n====自主实践‑成绩报告====");
    print("总人数：${students.length}，及格人数：$passCount");
  }
}
mixin LoggerP {
  void log(String msg) => print("[自主日志] $msg");
}
class GradeBookP with LoggerP, ReportPrinter {
  final List<StudentP> _students;
  GradeBookP(List<StudentP> students) : _students = students;
  double average() {
    if (_students.isEmpty) return 0;
    return _students.fold<double>(0, (sum, s) => sum + s.score) / _students.length;
  }

  int countPassed() => _students.where((s) => s.passed).length;
  void complexStats() {
    final passList = _students.where((s) => s.passed).toList();
    final passNameList = passList.map((s) => s.name).toList();
    final allPass = _students.every((s) => s.passed);
    final passTotalScore = passList.fold<double>(0, (sum, stu) => sum + stu.score);
    final firstExcellent = _students.firstWhere(
      (s) => s.score >= 85,
      orElse: () => StudentP("00", "无优秀学生", 0),
    );
    log("及格名单：$passNameList");
    log("全班全部及格？：$allPass");
    log("及格生总分：$passTotalScore");
    log("第一位优秀学生：${firstExcellent.name}");
  }
}
