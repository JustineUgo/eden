
import 'package:eden/app/modules/onboard/controller/onboard_controller.dart';
import 'package:eden/app/modules/onboard/view/onboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../widget_for_testing.dart';


void main() {
  setUp(() {
    Get.put(OnboardController());
  });
  group("Onboard screen ", () {
    testWidgets('check user can swipe through onboard screens', (WidgetTester tester) async {
      await tester.pumpWidget(widgetForTesting(child: const OnboardScreen()));

      //First Screen
      expect(find.text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod."), findsOneWidget);
      expect(find.byKey(const Key('signup')), findsOneWidget);
      expect(find.text("Order Fast, \nRecieve Quick!"), findsOneWidget);

      //Second Screen
      await tester.fling(find.byKey(const Key('onboard-screen')), const Offset(-400, 0), 200);
      await tester.pumpAndSettle();

      expect(find.text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod."), findsOneWidget);
      expect(find.byKey(const Key('signup')), findsOneWidget);
      expect(find.text("See It, \nTrack It!"), findsOneWidget);
      await tester.pumpAndSettle();

      //Third Screen
      await tester.fling(find.byKey(const Key('onboard-screen')), const Offset(-400, 0), 200);
      await tester.pumpAndSettle();

      expect(find.text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod."), findsOneWidget);
      expect(find.byKey(const Key('signup')), findsOneWidget);
      expect(find.text("We are\nHumaans!"), findsOneWidget);
      await tester.pumpAndSettle();

      //First Screen
      await tester.fling(find.byKey(const Key('onboard-screen')), const Offset(400, 0), 200);
      await tester.fling(find.byKey(const Key('onboard-screen')), const Offset(400, 0), 200);
      await tester.pumpAndSettle();
      expect(find.text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod."), findsOneWidget);
      expect(find.byKey(const Key('signup')), findsOneWidget);
      expect(find.text("Order Fast, \nRecieve Quick!"), findsOneWidget);
    });
  });
}
