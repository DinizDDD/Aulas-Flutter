import 'package:flutter/material.dart';

void main() {
  runApp(const StardewApp());
}

class StardewApp extends StatelessWidget {
  const StardewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afazeres da Fazenda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF8B5E3C), 
        scaffoldBackgroundColor: const Color(0xFFF7EFD2), 
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF8B5E3C),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: "Verdana",
            color: Color(0xFF5A3825),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> _tarefas = [];

  @override
  void initState() {
    super.initState();
    _adicionarTarefasExemplo();
  }

  void _adicionarTarefasExemplo() {
    final tarefasExemplo = [
      {
        'url': 'https://static.fandomspot.com/images/02/28087/00-featured-character-surrounded-by-new-cow-sprites-from-ks-cow-replacers-stardew-valley-mod.jpg',
        'descricao': 'Ordenhar as vacas'
      },
      {
        'url': 'https://i.redd.it/nlmye1sdl0l91.jpg',
        'descricao': 'Colher o trigo'
      },
      {
        'url': 'https://stardewvalleywiki.com/mediawiki/images/0/01/Dog_Pen.png',
        'descricao': 'Alimentar o cachorro'
      },
      {
        'url': 'https://cdn.pixabay.com/photo/2017/09/23/19/34/hen-2780290_640.jpg',
        'descricao': 'Coletar ovos das galinhas'
      },
      {
        'url': 'https://cdn.pixabay.com/photo/2017/06/10/07/21/apple-2388608_640.jpg',
        'descricao': 'Colher maçãs'
      },
      {
        'url': 'https://cdn.pixabay.com/photo/2017/09/25/18/41/goat-2786726_640.jpg',
        'descricao': 'Cuidar das cabras'
      },
      {
        'url': 'https://cdn.pixabay.com/photo/2016/11/21/15/14/bee-1845735_640.jpg',
        'descricao': 'Coletar mel das abelhas'
      },
    ];

    setState(() {
      _tarefas.addAll(tarefasExemplo);
    });
  }

  void _adicionarTarefas(String url, String descricao, BuildContext context) {
    setState(() {
      _tarefas.add({'url': url, 'descricao': descricao});
    });
  }

  void _editarTarefas(int index, String url, String descricao) {
    setState(() {
      _tarefas[index] = {'url': url, 'descricao': descricao};
    });
  }

  void _deletarTarefas(int index) {
    setState(() {
      _tarefas.removeAt(index);
    });
  }

  void _confirmarExclusao(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF7EFD2),
          title: const Text(
            "Confirmar Exclusão",
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF5A3825)),
          ),
          content: const Text("Deseja remover essa tarefa da fazenda?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                _deletarTarefas(index);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5E3C),
              ),
              child: const Text("Remover"),
            ),
          ],
        );
      },
    );
  }

  void _showForm(BuildContext context) {
    final TextEditingController imageController = TextEditingController();
    final TextEditingController descricaoController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: const Color(0xFFF7EFD2),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "Nova Tarefa da Fazenda",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5A3825),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: imageController,
                    decoration: const InputDecoration(
                      labelText: 'URL da Imagem (opcional)',
                      labelStyle: TextStyle(color: Color(0xFF8B5E3C)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF8B5E3C)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: descricaoController,
                    decoration: const InputDecoration(
                      labelText: 'Descrição da tarefa (ex: Regar as plantas)',
                      labelStyle: TextStyle(color: Color(0xFF8B5E3C)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF8B5E3C)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton.icon(
                    onPressed: () {
                      _adicionarTarefas(
                        imageController.text,
                        descricaoController.text,
                        context,
                      );
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Nova tarefa adicionada à fazenda!"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B5E3C),
                    ),
                    icon: const Icon(Icons.add, color: Colors.amber),
                    label: const Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showFormEdit(BuildContext context, int index) {
    final TextEditingController imageController =
        TextEditingController(text: _tarefas[index]['url']);
    final TextEditingController descricaoController =
        TextEditingController(text: _tarefas[index]['descricao']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: const Color(0xFFF7EFD2),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "🐔 Editar Tarefa da Fazenda",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5A3825),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: imageController,
                    decoration: const InputDecoration(
                      labelText: 'Nova URL da Imagem',
                      labelStyle: TextStyle(color: Color(0xFF8B5E3C)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: descricaoController,
                    decoration: const InputDecoration(
                      labelText: 'Nova descrição da tarefa',
                      labelStyle: TextStyle(color: Color(0xFF8B5E3C)),
                    ),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton.icon(
                    onPressed: () {
                      _editarTarefas(
                        index,
                        imageController.text,
                        descricaoController.text,
                      );
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B5E3C),
                    ),
                    icon: const Icon(Icons.edit, color: Colors.amber),
                    label: const Text(
                      "Salvar",
                      style: TextStyle(color: Colors.amber),
                    ),
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
        title: const Text("Afazeres da Fazenda"),
        backgroundColor: const Color(0xFF8B5E3C),
        foregroundColor: Colors.amber,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: _tarefas.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return Tarefas(
              _tarefas[index]['url']!,
              _tarefas[index]['descricao']!,
              () => _showFormEdit(context, index),
              () => _confirmarExclusao(context, index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context),
        backgroundColor: const Color(0xFF8B5E3C),
        child: const Icon(Icons.add, color: Colors.amber),
      ),
    );
  }
}

class Tarefas extends StatelessWidget {
  final String imagem_url;
  final String descricao;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const Tarefas(this.imagem_url, this.descricao, this.onEdit, this.onDelete, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFF7D6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFF8B5E3C), width: 1.5),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imagem_url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.landscape,
                    size: 40,
                    color: Color(0xFF8B5E3C),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              descricao,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5A3825),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: onEdit, icon: const Icon(Icons.brush, color: Colors.green)),
                IconButton(onPressed: onDelete, icon: const Icon(Icons.delete, color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}