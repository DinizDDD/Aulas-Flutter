import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// LOGO
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 21, 196, 126),
                        Color.fromARGB(255, 174, 255, 214)
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  'logo.png',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// NOME
            TextField(
              decoration: InputDecoration(
                labelText: "Nome",
                prefixIcon: const Icon(Icons.person),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 153, 133, 226),
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// EMAIL
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: const Icon(Icons.email),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 153, 133, 226),
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// SENHA
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                prefixIcon: const Icon(Icons.lock),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 153, 133, 226),
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// CONFIRMAR SENHA
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirmar Senha",
                prefixIcon: const Icon(Icons.lock_outline),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 153, 133, 226),
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// BOTÃO CADASTRAR
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Arial",
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// BOTÃO VOLTAR
            TextButton(
              onPressed: () {},
              child: const Text("Já tenho conta"),
            )

          ],
        ),
      ),
    );
  }
}