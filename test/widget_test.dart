import 'package:eden/app/modules/onboard/view/onboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';


void main() {
  testWidgets('Initial test', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp( home: OnboardScreen()));

    expect(find.byKey(const Key('signup')), findsOneWidget);
  });
}
