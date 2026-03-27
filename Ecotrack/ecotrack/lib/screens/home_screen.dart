import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// NAVBAR
appBar: AppBar(
  backgroundColor: Colors.green,
  centerTitle: false,

  title: Row(
    children: [
      Image.asset(
        'logo.png',
        height: 50,
      ),
      const SizedBox(width: 10),
      const Text("EcoTrack"),
    ],
  ),

  actions: [
    IconButton(
      icon: const Icon(Icons.account_box),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    ),
    IconButton(
      icon: const Icon(Icons.notifications),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(Icons.door_back_door),
      onPressed: () {},
    ),
  ],
),

      /// CORPO
      body: Column(
        children: [

          /// CONTEÚDO PRINCIPAL
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// BEM-VINDO
                    const Text(
                      "Olá, (nome do usuário)",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Bem vindo ao Ecotrack.",
                      style: TextStyle(fontSize: 20),
                    ),

                    const SizedBox(height: 20),

                    /// CARDS     

                    Text("Resumo",
                    style: TextStyle(fontSize: 18),),

                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 2, // Intensidade da sombra
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Cantos arredondados
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.album),
                                  title: Text('Título do Card'),
                                  subtitle: Text('Subtítulo do conteúdo'),
                                ),
                              ],
                            ),
                          ),
                        ),
                         Expanded(
                          child: Card(
                            elevation: 2, // Intensidade da sombra
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Cantos arredondados
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.album),
                                  title: Text('Título do Card'),
                                  subtitle: Text('Subtítulo do conteúdo'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                     Row(
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 2, // Intensidade da sombra
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Cantos arredondados
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.album),
                                  title: Text('Título do Card'),
                                  subtitle: Text('Subtítulo do conteúdo'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                        child: Card(
                          elevation: 2, // Intensidade da sombra
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Cantos arredondados
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.album),
                                title: Text('Título do Card'),
                                subtitle: Text('Subtítulo do conteúdo'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                    const SizedBox(height: 30),

                    /// SEÇÃO EXTRA
                    const Text(
                      "Últimas atividades",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    _atividade("Sala A ficou em 1º lugar 🥇"),
                    _atividade("Nova ação sustentável registrada 🌿"),
                    _atividade("Pontuação atualizada 📊"),

                  ],
                ),
              ),
            ),
          ),

          /// FOOTER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.green,

            child: const Column(
              children: [
                Text(
                  "EcoTrack © 2026",
                  style: TextStyle(color: Colors.white),
                ),
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
    );
  }

  /// CARD
  Widget _card(String titulo, IconData icone) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Column(
          children: [
            Icon(icone, size: 30, color: Colors.green),
            const SizedBox(height: 10),
            Text(titulo),
          ],
        ),
      ),
    );
  }

  /// ATIVIDADES
  Widget _atividade(String texto) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.check_circle, color: Colors.green),
        title: Text(texto),
      ),
    );
  }
}