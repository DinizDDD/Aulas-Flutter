import 'package:flutter/material.dart';

void main() {
  runApp(const Agenda());
}

class Agenda extends StatelessWidget {
  const Agenda({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Agenda",
      home: HomeAgenda(),
    );
  }
}

class HomeAgenda extends StatelessWidget {
  const HomeAgenda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AgendOL")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(
                  "Agende aqui seus objetivos",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(height: 20),
              Container(width: 450, child: SearchBar()),
              SizedBox(height: 20),
              Container(
                width: 450,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.network(
                          "https://wiki.leagueoflegends.com/en-us/images/Infernal_Drake_Render.png?95a26",
                          width: 110,
                        ),
                        Text("1° Drag"),
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          "https://wiki.leagueoflegends.com/en-us/images/Voidgrub_Render.png?d1778",
                          width: 50,
                        ),
                        Text("Vastilarvas"),
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          "https://wiki.leagueoflegends.com/en-us/images/Rift_Herald_Render.png?0e9fc",
                          width: 100,
                        ),
                        Text("Arauto do Vale"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 450,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.network(
                          "https://wiki.leagueoflegends.com/en-us/images/Hextech_Drake_Render.png?e400f",
                          width: 110,
                        ),
                        Text("2° Drag"),
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          "https://wiki.leagueoflegends.com/en-us/images/Ocean_Drake_Render.png?e7393",
                          width: 110,
                        ),
                        Text("3° Drag"),
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN4a11xYB8cNdOUN03aTDRk5UEAjhUzFjqVQ&s",
                          width: 110,
                        ),
                        Text("4° Drag"),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: 450,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.network(
                          "https://wiki.leagueoflegends.com/en-us/images/thumb/All-Seeing_Baron_Nashor_Render.png/180px-All-Seeing_Baron_Nashor_Render.png?70807",
                          width: 80,
                        ),
                        Text("Baron Nashor"),
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          "https://wiki.leagueoflegends.com/en-us/images/thumb/Thornbound_Atakhan_Render.png/800px-Thornbound_Atakhan_Render.png?76bb1",
                          width: 120,
                        ),
                        Text("Atakhan"),
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          "https://wiki.leagueoflegends.com/en-us/images/thumb/Elder_Dragon_Render.png/800px-Elder_Dragon_Render.png?3fe9c",
                          width: 145,
                        ),
                        Text("Dragão Anciãoz'"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Calendar",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
