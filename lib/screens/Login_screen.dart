import 'package:fadba/screens/components/Textfield_button_widget.dart';
import 'package:fadba/screens/components/Textfield_widget.dart';
import 'package:fadba/screens/components/Textfield_widget_password.dart';
import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            //TELA COM IMAGEM E LOGO DA FADBA
            width: double.infinity,
            height: height * 0.2,
            child: DecoracaoDestaque(),
          ),
          SizedBox(
            //TELA COM FORMULARIO
            width: double.infinity,
            child: Form(
                child: Column(
              children: [
                MyCustomForm(
                  width: width,
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}

class DecoracaoDestaque extends StatelessWidget {
  const DecoracaoDestaque({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: CustomColor().getCorPadraoAzul,
        image: DecorationImage(
            image: AssetImage(
          'assets/logo_fadba_2.png',
        )),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key, required this.width}) : super(key: key);

  final width;

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  GlobalKey get getFormKey {
    return _formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 20.0),
          SizedBox(
            width: widget.width * 0.8,
            child: const TextfieldWidget(
                hinText: 'email',
                prefixIcon: Icons.email,
                sufixIcon: Icons.close,
                obscureText: false,
                textInputType: TextInputType.emailAddress),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
              width: widget.width * 0.8,
              child: const TextfieldPasswordWidget()),
          const SizedBox(height: 20.0),
          Center(
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Esqueci a senha"),
                ));
              },
              child: Text("Esqueci a senha?",
                  style: TextStyle(color: CustomColor().getCorPadraoAzul)),
            ),
          ),
          const SizedBox(height: 20.0),
          TextfieldButtonWidget(
            width: widget.width,
            formKey: getFormKey,
            nameButton: 'Login',
            isFill: true,
            padromColor: CustomColor().getCorPadraoAzul,
          )
          /*
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: CustomColor().getCorPadraoAzul,
                fixedSize: Size(width * 0.8, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                )),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processando informações')),
                );
              }
            },
            child: const Text('Login'),
          ),
          */
        ],
      ),
    );
  }
}
