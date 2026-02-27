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
      title: "Imagens",
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
        title: const Text(
          "Imagens Daoras",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
          child: Column(
            children: [
              Image.network(
                "https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2025/04/10/667026534-davi-brito.jpg",
                height: 300,
                width: 300,
              ),
              Image.network(
                "https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2024/08/15/2039245708-whatsapp-image-2024-08-15-at-121826.jpeg",
                height: 300,
                width: 300,
              ),
              Image.network(
                "https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2025/04/10/667026534-davi-brito.jpg",
                height: 300,
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
