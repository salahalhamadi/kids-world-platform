
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kids_world_platform/main.dart';

void main() {
  testWidgets('home screen shows Kids World learning sections',
      (tester) async {
    await tester.view.setSize(const Size(1200, 2000));
    await tester.view.setPhysicalSize(const Size(1200, 2000));
    await tester.view.devicePixelRatio = 1;

    await tester.pumpWidget(const KidsWorldApp());
    await tester.pumpAndSettle();

    expect(find.text('عالم الطفل'), findsOneWidget);
    expect(find.text('هيا نتعلم'), findsOneWidget);
    expect(find.text('الحروف'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('الحيوانات'),
      300,
      scrollable: find.byType(Scrollable).first,
    );

    await tester.pumpAndSettle();
    expect(find.text('الحيوانات'), findsOneWidget);

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
