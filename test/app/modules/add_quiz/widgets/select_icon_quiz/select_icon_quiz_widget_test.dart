import 'package:devquiz_web/app/modules/add_quiz/widgets/select_icon_quiz/select_icon_quiz_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';

main() {
  group('SelectIconQuizWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(SelectIconQuizWidget(title: 'T')));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}