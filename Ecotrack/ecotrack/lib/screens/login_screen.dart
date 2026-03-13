import 'package:ecotrack/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool ocultarSenha = true;
  final AuthService authService = AuthService();
  FocusNode emailFocus = FocusNode();
  FocusNode senhaFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    emailFocus.addListener(() {
      setState(() {});
    });
    senhaFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // cor de fundo
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromARGB(255, 21, 196, 126),
                          const Color.fromARGB(255, 174, 255, 214),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'logo.png',
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              TextFormField(
                focusNode: emailFocus,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',

                  prefixIcon: Icon(
                    Icons.email,
                    color: emailFocus.hasFocus
                        ? const Color.fromARGB(255, 59, 98, 215)
                        : const Color.fromARGB(
                            255,
                            92,
                            125,
                            224,
                          ), // muda a cor do icone
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 153, 133, 226),
                      width: 2,
                    ),
                  ),

                  floatingLabelStyle: TextStyle(
                    color: const Color.fromARGB(255, 153, 133, 226),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return "Digite seu email";
                  }
                  if (!value.contains("@") || !value.contains(".")){
                    return "Email inválido";
                  }
                  return null;
                },
                
              ),
              const SizedBox(height: 16),
              TextFormField(
                focusNode: senhaFocus,
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',

                  prefixIcon: Icon(
                    Icons.lock,
                    color: senhaFocus.hasFocus
                        ? const Color.fromARGB(255, 59, 98, 215)
                        : const Color.fromARGB(
                            255,
                            92,
                            125,
                            224,
                          ), 
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 153, 133, 226),
                      width: 2,
                    ),
                  ),
                  floatingLabelStyle: TextStyle(
                    color: const Color.fromARGB(255, 153, 133, 226),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return "Digite sua senha";
                  }
                  if (value.length < 6){
                    return "Senha deve ter no mínimo 6 caracteres";
                  }
                },

              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  validarLogin();
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(fontFamily: "Arial", fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(fontFamily: "Arial", fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //função validar login
  void validarLogin() {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      String senha = senhaController.text;

      String? resultado = AuthService().login(email, senha);

      if (resultado != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(resultado)));
      } else {
        ScaffoldMessenger.of(
          context, 
          ).showSnackBar(
            SnackBar(
              content:Text(
                "Login Realizado com Sucesso"
              )
            )
          );
      }
    }
  }
}
