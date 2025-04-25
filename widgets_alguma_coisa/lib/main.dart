import 'package:flutter/material.dart';

void main() {
  runApp(const Desafio());
}

class Desafio extends StatelessWidget {
  const Desafio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bolo",
      home: HomeColunas(),
    );
  }
}

class HomeColunas extends StatelessWidget {
  const HomeColunas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: const Color.fromARGB(255, 236, 230, 230),
                child: Text(
                  "Strawberry Lavnova",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 450,
                color: const Color.fromARGB(255, 236, 230, 230),
                child: Text(
                  "Pavlova is a merinque based dessert named after the Russian bailerine Anna Pavlova. Pavlova features crisp crust and soft, light inside, topped with fruit and whipped cream.",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 450,
                color: const Color.fromARGB(255, 236, 230, 230),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.red, size: 30),
                        Icon(Icons.star, color: Colors.red, size: 30),
                        Icon(Icons.star, color: Colors.red, size: 30),
                        Icon(Icons.star, color: Colors.red, size: 30),
                        Icon(Icons.star, color: Colors.red, size: 30),
                      ],
                    ),
                    Text("Muito bom"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 450,
                color: const Color.fromARGB(255, 236, 230, 230),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.list_outlined, color: Colors.red, size: 30),
                        Text("Lista"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.catching_pokemon,
                          color: Colors.red,
                          size: 30,
                        ),
                        Text("Pokemon"),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.do_disturb, color: Colors.red, size: 30),
                        Text("disturb"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Image.network(
            width: 400,
            "https://cdn.atarde.com.br/img/Artigo-Destaque/1310000/1200x675/Davi-Brito-reflete-sobre-fama-e-perda-de-seguidore0131060700202503140933-9.webp?fallback=https%3A%2F%2Fcdn.atarde.com.br%2Fimg%2FArtigo-Destaque%2F1310000%2FDavi-Brito-reflete-sobre-fama-e-perda-de-seguidore0131060700202503140933.jpg%3Fxid%3D6624270&xid=6624270",
          ),
        ],
      ),
    );
  }
}
