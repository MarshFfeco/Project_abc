import 'package:flutter/material.dart';

import '../components/Customform.dart';
import '../components/Decoracao_destaque.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                //TELA COM IMAGEM E LOGO DA FADBA
                width: double.infinity,
                height: height * 0.2,
                child: const DecoracaoDestaque(),
              ),
              SizedBox(
                //TELA COM FORMULARIO
                width: double.infinity,
                child: Form(
                    child: Column(
                  children: [
                    MyCustomFormLogin(
                      width: width,
                    ),
                  ],
                )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
