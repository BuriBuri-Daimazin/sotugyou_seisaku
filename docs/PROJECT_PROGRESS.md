# AI Travel Planner — 制作進捗

このファイルは、Codexが別の会話・別の制作回でも続きから再開するための引き継ぎ記録です。

## 現在地

- 現在の段階: フェーズ0「アプリの土台」
- 現在の状態: 起動点、テーマ、予定の中心データモデルを実装
- まだ未着手: ナビゲーション、HOME画面、予定入力、保存、API接続

## 確定している方針

- Flutter/DartでWebとAndroidを同一コードベースから作る
- 機能単位の `features/` 構成を採用する
- 外部APIはUIから直接呼ばず、data/repository層を通す
- APIキーや秘密情報はアプリへ直接埋め込まない
- 空で作成済みの構成ファイルは必要になった段階で実装する

## 制作記録

### 2026-09-18 — Web・Android起動手順を文書化

実施内容:

- `docs/起動方法.md` にWeb版とAndroid実機版の初回・2回目以降の起動方法を追加
- iPhoneなど同一Wi-Fi内の端末からWeb版を確認する方法を追加
- Hot Reload、基本的な復旧方法、配布用ビルド方法を追加

### 2026-09-18 — アプリ名称を「卒業制作」へ統一

実施内容:

- Androidホーム画面、Flutter、Web/PWAで表示する名称を「卒業制作」に変更
- Dartパッケージ名を `sotugyou_seisaku` に変更
- アプリクラスを `SotugyouSeisakuApp` に変更
- Android namespaceとKotlin packageを `com.example.sotugyou_seisaku` に変更
- 既に実機へ導入したアプリを上書き更新できるよう、Android applicationId `com.example.ai_travel_planner` は維持

検証結果:

- `dart format`: 130ファイル確認、1ファイル整形
- `flutter analyze`: No issues found
- `flutter test`: 1件成功、All tests passed
- 旧フォルダの絶対パスを保持していたGradleキャッシュを削除後、`flutter build apk --debug`: 成功

### 2026-09-18 — プロジェクト名変更・チーム開発計画

実施内容:

- プロジェクトフォルダを `ai_travel_planner` から `sotugyou_seisaku` へ変更
- `docs/TEAM_DEVELOPMENT_PLAN.md` を追加
- 機能単位の担当分け、制作フェーズ、Git運用、完了条件を明文化
- Flutterのパッケージ名とAndroidのアプリIDは、既存環境を壊さないため現時点では変更していない

検証結果:

- 新しいフォルダで `flutter pub get`: 成功
- `flutter analyze`: No issues found
- `flutter test`: 1件成功、All tests passed

### 2026-09-16 — フェーズ0開始

実装内容:

- `lib/main.dart`: アプリ起動点
- `lib/app/app.dart`: MaterialAppと暫定起動画面
- `lib/app/theme_tokens.dart`: 色、余白、角丸の共通値
- `lib/app/app_theme.dart`: ライト／ダークテーマ
- `lib/app/app_constants.dart`: アプリ共通定数
- `place.dart`: 場所モデルとJSON変換
- `transportation_method.dart`: 移動方法enum
- `travel_schedule.dart`: 予定モデルとJSON変換
- `.agents/AGENTS.md`: 今後のCodex向け継続ルール

検証結果:

- `dart format`: 対象9ファイルを整形済み
- `flutter analyze`: No issues found
- `flutter test`: 1件成功、All tests passed

## 次に行うこと

1. 予定データを保存するRepositoryのインターフェースを作る
2. ローカル保存実装を追加する
3. Repositoryの単体テストを追加する
4. その後にボトムナビゲーションへ進む

## 既知の注意事項

- Androidエミュレーターは容量不足のため使用せず、Android実機で確認する
- iOSネイティブビルドはWindowsでは行わず、iPhoneはWeb版を利用する
- 多数の空ファイルは最終規模確認用であり、完成済みという意味ではない
- 2026-09-18のAndroid実機初回ビルドで、必要なNDK `28.2.13676358` が未導入のため失敗した
- `sdkmanager.bat` の自動導入処理が終了コード `0xC0000409` で異常終了するため、Android StudioのSDK ManagerからNDKを明示的に追加して再実行する
- NDK `28.2.13676358` の導入は完了した
- 次の実機ビルドではTemp内の `app.dill` が消失してDartコンパイラが終了した。Cドライブ空きは約7.1GBのため、空き容量を増やし、プロジェクト内の専用Tempを指定して再試行する
- その後の実機ビルドで、未使用の `permission_handler 13.0.2` がcompileSdk 37を要求し、プロジェクトのAGP 9.1／compileSdk 36と競合した
- 現段階では権限APIを使用していないため `permission_handler` を依存関係から外した。位置情報実装時に互換バージョンを再選定する
- GradleがKotlinキャッシュを掴んだため一度ビルドに失敗したが、Gradle Daemon停止と `flutter clean` 後の再実行で解消した
- Androidビルド中に必要なCMake `3.22.1` がAndroid SDKへ自動導入された
- 2026-09-18に `flutter pub get`、`flutter analyze`、`flutter test`、`flutter build apk --debug` がすべて成功した
- 生成APK: `build/app/outputs/flutter-apk/app-debug.apk`
- Temp内のDartコンパイラ生成物消失を避けるため、プロジェクト内 `.flutter_temp` を検証時に使用し、Git管理対象外にした
