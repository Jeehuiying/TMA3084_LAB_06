import 'package:flutter_test/flutter_test.dart';
import 'package:lab_06/main.dart';

void main() {
  testWidgets('Hotel Booking Application smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const HotelApp());

    expect(find.text('Hotel Booking Application'), findsOneWidget);
  });
}
