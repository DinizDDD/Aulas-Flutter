import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Map<String, dynamic>> _localizacoes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagens no Centro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: NetworkImage('https://i.redd.it/ety59mbye2o61.png'),
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Image(
              image: NetworkImage('https://i.pinimg.com/736x/15/da/c1/15dac1e4bb13cac6ada41c9df64b5069.jpg'),
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Image(
              image: NetworkImage('https://i.redd.it/ety59mbye2o61.png'),
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
