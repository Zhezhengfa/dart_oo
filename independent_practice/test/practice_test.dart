import 'package:test/test.dart';
import '../lib/student_p.dart';
import '../lib/gradebook_p.dart';
void main() {
  group("自主实践单元测试组", () {
    final testStus = [
      StudentP("s1", "同学A", 80),
      StudentP("s2", "同学B", 40),
    ];
    final gb = GradeBookP(testStus);
    test("用例1：正常统计平均分、及格人数", () {
      expect(gb.average(), equals(60.0));
      expect(gb.countPassed(), equals(1));
    });
    test("用例2：设置非法分数抛出ArgumentError异常", () {
      final s = StudentP("999", "测试学生");
      expect(() => s.score = 105, throwsArgumentError);
      expect(() => s.score = -10, throwsArgumentError);
    });
  });
}
