import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Aplicativo principal (StatelessWidget)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo Flutter Completo - Uma Tela',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FlutterExampleScreen(),
    );
  }
}

/// Tela única com todos os conceitos
class FlutterExampleScreen extends StatefulWidget {
  const FlutterExampleScreen({super.key});

  @override
  State<FlutterExampleScreen> createState() => _FlutterExampleScreenState();
}

class _FlutterExampleScreenState extends State<FlutterExampleScreen> {
  bool showGrid = false;
  int counter = 0;

  // --- MOCK DATA (dados simulados)
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Celular',
      'price': 1999.99,
      'image': 'assets/images/phone.png',
      'isNetwork': false,
    },
    {
      'name': 'Relógio',
      'price': 999.99,
      'image': 'assets/images/watch.png',
      'isNetwork': false,
    },
    {
      'name': 'Notebook',
      'price': 4599.99,
      'image': 'https://picsum.photos/200',
      'isNetwork': true,
    },
    {
      'name': 'Fone de ouvido',
      'price': 299.99,
      'image': 'https://picsum.photos/201',
      'isNetwork': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demonstração Flutter (1 Tela)'),
        actions: [
          IconButton(
            onPressed: () => setState(() => showGrid = !showGrid),
            icon: Icon(showGrid ? Icons.list : Icons.grid_view),
            tooltip: 'Alternar entre lista e grade',
          ),
        ],
      ),
      body: Column(
        children: [
          // --- STATEFULWIDGET (contador simples)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Contador: $counter',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => setState(() => counter++),
                  child: const Text('Incrementar'),
                ),
              ],
            ),
          ),

          const Divider(),

          // --- LISTVIEW OU GRIDVIEW COM MOCK DATA
          Expanded(
            child: showGrid
                ? GridView.builder(
                    itemCount: products.length,
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) =>
                        ProductCard(product: products[index]),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCard(product: products[index]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

/// --- COMPONENTE REUTILIZÁVEL (StatelessWidget)
/// Card de produto
class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: product['isNetwork']
                ? Image.network(product['image'], fit: BoxFit.cover)
                : Image.asset(product['image'], fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(
            product['name'],
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 4),
          Text('R\$ ${product['price'].toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
