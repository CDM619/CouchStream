
import 'package:flutter_test/flutter_test.dart';
import 'package:couchstream_app/main.dart';

void main() {
  testWidgets('CouchStream launches', (WidgetTester tester) async {
    await tester.pumpWidget(const CouchStreamApp());

    expect(find.text('Movies feel better together.'), findsOneWidget);
    expect(find.text('Couch'), findsOneWidget);
  });
}
