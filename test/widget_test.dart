
import 'package:flutter_test/flutter_test.dart';
import 'package:kids_world_platform/main.dart';

void main() {
  testWidgets('home screen shows Kids World learning sections',
      (tester) async {
    await tester.pumpWidget(const KidsWorldApp());

    await tester.pumpAndSettle();

    expect(find.text('عالم الطفل'), findsOneWidget);
    expect(find.text('هيا نتعلم'), findsOneWidget);
    expect(find.text('الحروف'), findsOneWidget);
    expect(find.text('الحيوانات'), findsOneWidget);
  });
}
