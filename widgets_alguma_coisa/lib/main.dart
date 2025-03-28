import 'package:flutter/material.dart';

void main() {
  runApp(const PrimeiraTela());
}

class PrimeiraTela extends StatelessWidget {
  const PrimeiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu título",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ZapZap", style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print("Botão pressionado");
              },
              icon: Icon(Icons.add_home_work),
            ),
          ],
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 300,
                color: Colors.green,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "NÃO QUERO LUX SUPORTE MEU TIME",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(height: 100),
              Container(height: 200, width: 300, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
