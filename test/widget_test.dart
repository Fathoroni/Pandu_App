import 'package:flutter_test/flutter_test.dart';

import 'package:pandu_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PanduApp());

    // Verify that our app main text is present.
    expect(find.text('Initial Setup Complete'), findsOneWidget);
  });
}
