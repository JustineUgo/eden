
import 'package:eden/app/modules/auth/view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../widget_for_testing.dart';

void main() {
  setUp(() {
    
  });
    testWidgets('Auth screen', (WidgetTester tester) async {
      await tester.pumpWidget(widgetForTesting(child: const AuthScreen()));

      expect(find.text("Log in"), findsOneWidget);
      expect(find.byKey(const Key('github')), findsOneWidget);
      expect(find.byKey(const Key('google')), findsOneWidget);
      expect(find.byKey(const Key('logo')), findsOneWidget);

    });
}
