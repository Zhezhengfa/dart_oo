import 'package:test/test.dart';
import '../lib/student.dart';
import '../lib/gradebook.dart';
void main() {
  group("案例复现‑GradeBook测试", () {
    final stus = [Student('01', '李华', 90), Student('02', '王芳', 50)];
    final gb = GradeBook(stus);
    test("正常统计平均分、及格人数", () {
      expect(gb.average(), equals(70.0));
      expect(gb.countPassed(), equals(1));
    });
    test("非法分数抛出异常", () {
      final s = Student('99', "测试");
      expect(() => s.score = 120, throwsArgumentError);
      expect(() => s.score = -3, throwsArgumentError);
    });
  });
}
