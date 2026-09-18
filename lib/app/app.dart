import 'package:flutter/material.dart';

import 'app_theme.dart';

class SotugyouSeisakuApp extends StatelessWidget {
  const SotugyouSeisakuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '卒業制作',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const _FoundationPage(),
    );
  }
}

class _FoundationPage extends StatelessWidget {
  const _FoundationPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('卒業制作 — アプリの土台が完成しました')));
  }
}
