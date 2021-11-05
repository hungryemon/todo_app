import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/main.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  

  testWidgets('Validate Adding new Task in Todo List',
      (WidgetTester tester) async {

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
  });
}
