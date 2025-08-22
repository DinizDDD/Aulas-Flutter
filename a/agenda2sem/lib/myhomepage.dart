import 'package:flutter/material.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<Myhomepage> {


  //Criando um modal

  void _showForm(BuildContext context) {
    final TextEditingController imageController = TextEditingController();
    final TextEditingController descricaoController = TextEditingController(); 

    showDialog(
      context: context,
       builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cadastrar Tarefa",
                    style: TextStyle(
                      fontFamily: "Verdana",
                      fontSize: 18,
                      fontWeight: FontWeight.bold 
                    ),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.of(context) .pop();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: imageController,
                  decoration: InputDecoration(
                    labelText: 'URL da Imagem'
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: descricaoController,
                  decoration: InputDecoration(
                    labelText: 'Descrição da tarefa'
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                    
                      },
                       child: Text("Cadastrar",
                       style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey
                       ),
                       ),
                    ),
                    ElevatedButton(
                      onPressed: (){

                      },
                      child: Text("Cancelar",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey
                       ),))
                  ],
                ),
              ],
            )
          )
          ), 
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: [
          Tarefas("data:image/jpeg;base64,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", "Jogar League of Legends"),
          Tarefas("data:image/png;base64,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", "Jogar Valorant"),
          Tarefas("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt_l8bbYCoXr-ufcS0SAG4M58GARGZtquQCg&s", "Fazer o Drag"),
          Tarefas("data:image/jpeg;base64,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", "Fazer o Baron")
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showForm(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Classe tarefa

class Tarefas extends StatelessWidget {
  final String imagem_url;
  final String desc_tarefa;

    void _showEdit(BuildContext context) {
      final TextEditingController imageEdit = TextEditingController();
      final TextEditingController descricaoEdit = TextEditingController(); 


    showDialog(
      context: context,
       builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
                    child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Editar Tarefa",
                    style: TextStyle(
                      fontFamily: "Verdana",
                      fontSize: 18,
                      fontWeight: FontWeight.bold 
                    ),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.of(context) .pop();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: imageEdit,
                  decoration: InputDecoration(
                    labelText: 'URL da Imagem'
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: descricaoEdit,
                  decoration: InputDecoration(
                    labelText: 'Descrição da tarefa'
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                    
                      },
                       child: Text("Editar",
                       style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey
                       ),
                       ),
                    ),
                    ElevatedButton(
                      onPressed: (){

                      },
                      child: Text("Cancelar",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey
                       ),))
                  ],
                ),
              ],
            )
          )
          ), 
        );
       }
       );
  }
  

  const Tarefas(this.imagem_url, this.desc_tarefa, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 115, 211, 214),
            height: 140,
          ),
          Container(
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.lightBlueAccent,
                    child: Image.network(imagem_url,),
                  ),
                ),
                Expanded(
                  child: Text(desc_tarefa, style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _showEdit(context);
                    },
                    child: Icon(Icons.edit)),
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}

