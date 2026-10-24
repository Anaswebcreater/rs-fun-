import 'package:flutter_test/flutter_test.dart';
import 'package:rs_fun/main.dart';

void main() {
  testWidgets('RS Fun welcome screen test', (WidgetTester tester) async {
    await tester.pumpWidget(const RSFunApp());

    expect(find.text('RS FUN'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}