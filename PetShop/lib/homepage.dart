import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> _pets = [];

  void _adicionarPet(String nome, String especie, String raca, String idade, String url, BuildContext context) {
    setState(() {
      _pets.add({
        'nome': nome,
        'especie': especie,
        'raca': raca,
        'idade': idade,
        'url': url,
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pet cadastrado com sucesso!'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _editarPet(int index, String nome, String especie, String raca, String idade, String url) {
    setState(() {
      _pets[index] = {
        'nome': nome,
        'especie': especie,
        'raca': raca,
        'idade': idade,
        'url': url,
      };
    });
  }

  void _deletarPet(int index) {
    setState(() {
      _pets.removeAt(index);
    });
  }

  void _confirmarExclusaoPet(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmar Exclusão"),
          content: const Text("Tem certeza que deseja excluir este pet?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                _deletarPet(index);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              child: const Text("Excluir"),
            ),
          ],
        );
      },
    );
  }

  void _showFormPet(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController especieController = TextEditingController();
    final TextEditingController racaController = TextEditingController();
    final TextEditingController idadeController = TextEditingController();
    final TextEditingController urlController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFF7F9FC),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Cadastrar Pet",
                        style: TextStyle(
                          fontFamily: "Verdana",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(labelText: 'Nome do Pet'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: especieController,
                    decoration: const InputDecoration(labelText: 'Espécie'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: racaController,
                    decoration: const InputDecoration(labelText: 'Raça'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: idadeController,
                    decoration: const InputDecoration(labelText: 'Idade'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: urlController,
                    decoration: const InputDecoration(labelText: 'URL da Foto'),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (nomeController.text.isEmpty ||
                              especieController.text.isEmpty ||
                              racaController.text.isEmpty ||
                              idadeController.text.isEmpty ||
                              urlController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Por favor, preencha todos os campos!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            return;
                          }
                          showDialog(
                            context: context,
                            builder: (BuildContext dialogContext) {
                              return AlertDialog(
                                title: const Text("Confirmar Cadastro"),
                                content: const Text("Deseja realmente cadastrar este pet?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(dialogContext).pop(); 
                                    },
                                    child: const Text("Cancelar"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _adicionarPet(
                                        nomeController.text,
                                        especieController.text,
                                        racaController.text,
                                        idadeController.text,
                                        urlController.text,
                                        context,
                                      );
                                      Navigator.of(dialogContext).pop(); 
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A90E2)),
                                    child: const Text("Confirmar"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4A90E2)),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF7F9FC),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4A90E2)),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF7F9FC),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showFormEditPet(BuildContext context, int index) {
    final pet = _pets[index];

    final TextEditingController nomeController = TextEditingController(text: pet['nome']);
    final TextEditingController especieController = TextEditingController(text: pet['especie']);
    final TextEditingController racaController = TextEditingController(text: pet['raca']);
    final TextEditingController idadeController = TextEditingController(text: pet['idade']);
    final TextEditingController urlController = TextEditingController(text: pet['url']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                color: Color(0xFFF7F9FC),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Editar Pet",
                        style: TextStyle(
                          fontFamily: "Verdana",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(controller: nomeController, decoration: const InputDecoration(labelText: 'Nome do Pet')),
                  const SizedBox(height: 10),
                  TextField(controller: especieController, decoration: const InputDecoration(labelText: 'Espécie')),
                  const SizedBox(height: 10),
                  TextField(controller: racaController, decoration: const InputDecoration(labelText: 'Raça')),
                  const SizedBox(height: 10),
                  TextField(controller: idadeController, decoration: const InputDecoration(labelText: 'Idade')),
                  const SizedBox(height: 10),
                  TextField(controller: urlController, decoration: const InputDecoration(labelText: 'URL da Foto')),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _editarPet(
                            index,
                            nomeController.text,
                            especieController.text,
                            racaController.text,
                            idadeController.text,
                            urlController.text,
                          );
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4A90E2)),
                        child: const Text(
                          'Salvar',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF7F9FC),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4A90E2)),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF7F9FC),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pets"),
        backgroundColor: Color(0xFF4A90E2),
      ),
      body: _pets.isEmpty
          ? const Center(
              child: Text(
                "Nenhum pet cadastrado ainda.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: _pets.length,
              itemBuilder: (context, index) {
                final pet = _pets[index];
                return PetCard(
                  imagemUrl: pet['url']!,
                  nome: pet['nome']!,
                  especie: pet['especie']!,
                  raca: pet['raca']!,
                  idade: pet['idade']!,
                  onEdit: () => _showFormEditPet(context, index),
                  onDelete: () => _confirmarExclusaoPet(context, index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFormPet(context),
        backgroundColor: Color(0xFF4A90E2),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final String imagemUrl;
  final String nome;
  final String especie;
  final String raca;
  final String idade;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PetCard({
    super.key,
    required this.imagemUrl,
    required this.nome,
    required this.especie,
    required this.raca,
    required this.idade,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Card(
        elevation: 6, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: const Color(0xFFF7F9FC),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imagemUrl,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 90,
                      height: 90,
                      color: Colors.grey[300],
                      child: const Icon(Icons.pets, size: 40, color: Colors.grey),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      nome,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9F8FFF),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text("Espécie: $especie"),
                    Text("Raça: $raca"),
                    Text("Idade: $idade"),
                  ],
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit, color: Color(0xFF9F8FFF)),
                    tooltip: "Editar",
                  ),
                  const SizedBox(height: 8),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    tooltip: "Excluir",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

