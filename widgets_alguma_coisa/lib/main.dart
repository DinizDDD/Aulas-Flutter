// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Atividade 1",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.menu),
            onPressed: () => {},
          ),
          title: Text("Page Title", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () => {},
              icon: Icon(Icons.favorite),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () => {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              color: Colors.white,
              onPressed: () => {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 300,
                  child: Center(
                    child: Text("DS - 2025", style: TextStyle(fontSize: 20)),
                  ),
                ),
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvBRp3rDa9EMleXo2x1uRINZQdAYv-IfQBdA&s, width: 50.0,',
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.indigo,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Pesquisa",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Pessoa"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Configurações",
            ),
          ],
        ),
      ),
    );
  }
}
