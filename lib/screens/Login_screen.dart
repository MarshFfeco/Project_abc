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
      body: SingleChildScrollView(
        child: Column(
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
                  MyCustomForm(),
                ],
              )),
            )
          ],
        ),
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
  MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 20.0),
          SizedBox(
            width: width * 0.8,
            child: MyCustomFormEmail(width: width),
          ),
          SizedBox(height: 20.0),
          SizedBox(
            width: width * 0.8,
            child: MyCustomFormPassword(width: width),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Text(
              "Esqueci a senha?",
              style: TextStyle(color: CustomColor().getCorPadraoAzul),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: CustomColor().getCorPadraoAzul,
                fixedSize: Size(width * 0.8, 50),
                shape: RoundedRectangleBorder(
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
        ],
      ),
    );
  }
}

class MyCustomFormPassword extends StatefulWidget {
  MyCustomFormPassword({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<MyCustomFormPassword> createState() => _MyCustomFormPasswordState();
}

class _MyCustomFormPasswordState extends State<MyCustomFormPassword> {
  bool _securityText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ]),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: _securityText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.key,
            color: CustomColor().getCorPadraoAzul,
          ),
          suffix: IconButton(
              icon: Icon(_securityText
                  ? Icons.remove_red_eye_rounded
                  : Icons.remove_red_eye_outlined),
              onPressed: () => setState(() => _securityText = !_securityText)),
          hintText: 'Senha',
          hintStyle: TextStyle(color: CustomColor().getCorPadraoAzul),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'erro';
          }
          return null;
        },
      ),
    );
  }
}

class MyCustomFormEmail extends StatefulWidget {
  const MyCustomFormEmail({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  State<MyCustomFormEmail> createState() => _MyCustomFormEmailState();
}

class _MyCustomFormEmailState extends State<MyCustomFormEmail> {
  final _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ]),
      child: TextFormField(
        controller: _myController,
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.email,
            color: CustomColor().getCorPadraoAzul,
          ),
          suffix: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => setState(() => _myController.clear()),
          ),
          hintText: 'Email',
          hintStyle: TextStyle(color: CustomColor().getCorPadraoAzul),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Erro';
          }
          return null;
        },
      ),
    );
  }
}
