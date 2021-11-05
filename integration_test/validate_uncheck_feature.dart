import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/main.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  testWidgets('Validate Uncheck Feature', (WidgetTester tester) async {
    String title = 'Test Task';
    await tester.pumpWidget(const MyApp()); // Create main app
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));

    //Adding 1 item
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));

    //Find TextField by key
    final Finder enterTask = find.byKey(const ValueKey('enterTask'));

    //Ensure The Textfield on the page
    expect(enterTask, findsOneWidget);

    //Entering Item
    await tester.enterText(enterTask, title);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));

    //Press Add
    await tester.tap(find.text("Add"));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));

    //Find checkbox
    final checkboxFinder = find.byKey(const ValueKey('checkBoxKey0'));
    var checkbox = tester.firstWidget(checkboxFinder) as Checkbox;
    expect(checkbox.value, false);

    //Click on newly added task
    await tester.tap(find.byKey(const ValueKey('checkBoxKey0')));
    await tester.pumpAndSettle();
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    //Check if checkbox is checked
    checkbox = tester.firstWidget(checkboxFinder) as Checkbox;
    expect(checkbox.value, true);

    //final titleFinder = tester.widget<Text>(find.text(title));
    //expect(titleFinder.style,TextDecoration.lineThrough);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));

    //Click on newly added checked task
    await tester.tap(find.byKey(const ValueKey('checkBoxKey0')));
    await tester.pumpAndSettle();
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    //Check if chekbox is unchecked
    checkbox = tester.firstWidget(checkboxFinder) as Checkbox;
    expect(checkbox.value, false);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 2));
  });
}
