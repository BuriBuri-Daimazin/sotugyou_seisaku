import 'package:sotugyou_seisaku/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('アプリの土台が起動する', (tester) async {
    await tester.pumpWidget(const SotugyouSeisakuApp());

    expect(find.text('卒業制作 — アプリの土台が完成しました'), findsOneWidget);
  });
}
