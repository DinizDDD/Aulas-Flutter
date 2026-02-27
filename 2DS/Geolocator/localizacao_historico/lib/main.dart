import 'package:flutter/material.dart';
import 'package:localizacao_historico/screen/tela_principal.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 159, 119, 167),
          brightness: Brightness.light),

   
      ),
      home: TelaPrincipal()
    );
  }
}

