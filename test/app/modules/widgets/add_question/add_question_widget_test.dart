import 'package:devquiz_web/app/modules/widgets/add_question/add_question_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';

main() {
  group('AddQuestionWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(AddQuestionWidget(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}