import 'package:flutter/material.dart';
import 'widgets/layout/main_scaffold.dart';

void main() {
  runApp(const FlowmerceApp());
}

class FlowmerceApp extends StatelessWidget {
  const FlowmerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flowmerce',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainScaffold(),
    );
  }
}
