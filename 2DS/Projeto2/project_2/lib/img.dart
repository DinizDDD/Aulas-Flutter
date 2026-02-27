import 'package:flutter/material.dart';

void main() {
  runApp(const Colunas());
}

class Colunas extends StatelessWidget {
  const Colunas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Colunitas",
      home: HomeColunas(),
    );
  }
}

class HomeColunas extends StatelessWidget {
  const HomeColunas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 1, 135, 197),
      ),
      body: Padding(
        padding: const EdgeInsets.all(275.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://cdn.ibahia.com/img/inline/330000/Ex-BBB-Davi-Brito-volta-a-sensualizar-no-banho-e-f0033019300202410311156.jpg?xid=1731313",
              height: 120,
              width: 120,
            ),
          ],
        ),
      ),
    );
  }
}
