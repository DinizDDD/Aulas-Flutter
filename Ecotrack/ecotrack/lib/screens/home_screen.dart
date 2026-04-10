import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            Image.asset('logo.png', height: 40),
            const SizedBox(width: 10),
            const Text("EcoTrack"),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Olá, (nome do usuario) 👋",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Bem-vindo ao EcoTrack",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        Icon(Icons.bar_chart, color: Colors.green),
                        SizedBox(width: 5),
                        Text(
                          "RESUMO",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        _card(Icons.recycling, "12", "Coletas"),
                        _card(Icons.emoji_events, "340", "Pontos"),
                        _card(Icons.eco, "18kg", "CO₂"),
                        _card(Icons.track_changes, "75%", "Meta"),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: const [
                        Icon(Icons.flash_on, color: Colors.orange),
                        SizedBox(width: 5),
                        Text(
                          "AÇÕES RÁPIDAS",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _acao(Icons.add, "Registrar coleta"),
                    _acao(Icons.location_on, "Pontos de coleta"),
                    _acao(Icons.bar_chart, "Relatórios"),
                    _acao(Icons.history, "Histórico"),
                    const SizedBox(height: 30),
                    Row(
                      children: const [
                        Icon(Icons.access_time, color: Colors.black54),
                        SizedBox(width: 5),
                        Text(
                          "ATIVIDADES RECENTES",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _atividade("Plástico reciclado", "+20 pts"),
                    _atividade("Papel descartado", "+10 pts"),
                    _atividade("Vidro reciclado", "+15 pts"),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.green,
            child: const Column(
              children: [
                Text("EcoTrack © 2026", style: TextStyle(color: Colors.white)),
                SizedBox(height: 5),
                Text(
                  "Sustentabilidade na escola",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Histórico"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Mapa"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }

  Widget _card(IconData icon, String valor, String titulo) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.green, size: 30),
            const SizedBox(height: 10),
            Text(valor, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(titulo),
          ],
        ),
      ),
    );
  }

  Widget _acao(IconData icon, String texto) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(texto),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }

  Widget _atividade(String texto, String pontos) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.check_circle, color: Colors.green),
        title: Text(texto),
        trailing: Text(pontos),
      ),
    );
  }
}