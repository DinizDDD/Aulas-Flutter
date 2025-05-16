import 'package:flutter/material.dart';

void main() {
  runApp(const BoloApp());
}

class BoloApp extends StatelessWidget {
  const BoloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bolo App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BoloHomePage(),
    );
  }
}

class BoloHomePage extends StatelessWidget {
  const BoloHomePage({super.key});

  @override
  Widget build(Buid) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bolo App')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 211, 211, 211),
              child: Text(
                "Welcome to Bolo App",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 211, 211, 211),
              child: Text(
                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyFg2hGVh5ZU7xk24xKQ2uZb1oWngA46tiIA&s",
            ),
          ],
        ),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 211, 211, 211),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                ],
              ),
              Text("Muito bom"),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 211, 211, 211),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.kitchen),
                  Row(children: [Text("Prep")]),
                  Row(children: [Text("25m")]),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.kitchen),
                  Row(children: [Text("Prep")]),
                  Row(children: [Text("25m")]),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.kitchen),
                  Row(children: [Text("Prep")]),
                  Row(children: [Text("25m")]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
