import 'package:flutter/material.dart';
import 'package:pizzanove/pages/menusalg.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Login',
            labelText: 'Login',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        SizedBox(height: 20.0),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Senha',
            labelText: 'Senha',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Navegar para a página menu_salg.dart
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PizzaMenuPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.orange,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5, // Elevação do botão
          ),
          child: const Text('Acessar'),
        ),
        SizedBox(height: 10.0),
        TextButton(
          onPressed: () {
            // Implementar a lógica de recuperação de senha aqui
          },
          child: const Text('Esqueci minha senha'),
        ),
      ],
    );
  }
}
