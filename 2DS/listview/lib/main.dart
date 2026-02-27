import 'package:flutter/material.dart';

void main() {
  runApp(const Listbill());
}

class Listbill extends StatelessWidget {
  const Listbill({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List Bill",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Mypage(),
    );
  }
}

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Bill")),
      body: ListView(
        children: [
          Item(),
          Item(),
          Item(),
          Item(),
          Item(),
          Item(),
          Item(),
          Item(),
          Item(),
          Item(),
          Item(),
          Item(),
          Item(),
          Item(),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(
              Icons.home,
              size: 50,
              color: const Color.fromARGB(255, 19, 63, 98),
            ),
            Text(
              "Exemplo Aula",
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 186, 245, 10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
