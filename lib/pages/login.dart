import 'package:flutter/material.dart';
import 'package:pizzanove/pages/cadastropage.dart';
import 'package:pizzanove/pages/forgetPassword_Page.dart';
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
        Image.network(
          'lib/images/logo.png',
          height: 250.0,
        ),
        SizedBox(height: 20.0),
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
            // ir para a página menu_salg.dart
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PizzaMenuPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5, // Elevação do botão
          ),
          child: const Text('Acessar'),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CadastroPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5, // Elevação do botão
          ),
          child: const Text('Registre-se'),
        ),
        SizedBox(height: 10.0),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
            );
          },
          child: const Text('Esqueci minha senha'),
        ),
      ],
    );
  }
}
