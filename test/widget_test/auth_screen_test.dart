import 'package:eden/app/data/provider/provider.dart';
import 'package:eden/app/modules/auth/controller/auth_controller.dart';
import 'package:eden/app/modules/auth/view/auth_view.dart';
import 'package:eden/app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import '../widget_for_testing.dart';

class StorageServiceMock extends Mock implements StorageService {}

class EdenProviderMock extends Mock implements EdenProvider {}

void main() {
  late StorageService storage;
  late EdenProvider provider;
  setUp(() {
    storage = StorageServiceMock();
    provider = EdenProviderMock();
    Get.put(AuthController(storage: storage, provider: provider));
    when(() => storage.setIsFirstLaunchStatus()).thenAnswer((_) => Future.value());
  });
  testWidgets('Auth screen',skip:true, (WidgetTester tester) async {
    await tester.pumpWidget(widgetForTesting(child: const AuthScreen(isTest: true)));

    expect(find.text("Log in"), findsOneWidget);
    // await Future.delayed(const Duration(seconds: 3));
    expect(find.byKey(const Key('signup-option')), findsOneWidget);
    expect(find.byKey(const Key('logo')), findsOneWidget);
  });
}
