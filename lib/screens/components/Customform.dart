import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';
import 'Textfield_button_widget.dart';
import 'Textfield_widget.dart';
import 'Textfield_widget_password.dart';

class MyCustomFormLogin extends StatefulWidget {
  const MyCustomFormLogin({Key? key, required this.width}) : super(key: key);

  final width;

  @override
  State<MyCustomFormLogin> createState() => _MyCustomFormLoginState();
}

class _MyCustomFormLoginState extends State<MyCustomFormLogin> {
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
          const SizedBox(height: 60.0),
          SizedBox(
            width: widget.width * 0.8,
            child: const TextfieldWidget(
                hinText: 'Email',
                prefixIcon: Icons.email,
                sufixIcon: Icons.close,
                textInputType: TextInputType.emailAddress),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: widget.width * 0.8,
            child: const TextfieldPasswordWidget(
              hinText: "Senha",
              isConfirm: false,
            ),
          ),
          const SizedBox(height: 25.0),
          SizedBox(
            width: widget.width * 0.8,
            child: TextfieldButtonWidget(
              width: widget.width,
              formKey: getFormKey,
              nameButton: 'Login',
              isFill: false,
              padromColor: CustomColor().getCorPadraoAzul,
              isButtonPage: false,
              isBVPage: false,
            ),
          ),
          const SizedBox(height: 25.0),
          SizedBox(
            width: widget.width * 0.8,
            child: TextfieldButtonWidget(
              width: widget.width,
              formKey: getFormKey,
              nameButton: 'Cadastrar-se',
              isFill: true,
              padromColor: CustomColor().getCorPadraoAzul,
              isButtonPage: true,
              isBVPage: false,
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomFormSignup extends StatefulWidget {
  const MyCustomFormSignup({Key? key, required this.width}) : super(key: key);

  final width;

  @override
  _MyCustomFormSignupState createState() => _MyCustomFormSignupState();
}

class _MyCustomFormSignupState extends State<MyCustomFormSignup> {
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
          const SizedBox(height: 60.0),
          SizedBox(
            width: widget.width * 0.8,
            child: const TextfieldWidget(
                hinText: 'Nome',
                prefixIcon: Icons.person,
                sufixIcon: Icons.close,
                textInputType: TextInputType.emailAddress),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: widget.width * 0.8,
            child: const TextfieldPasswordWidget(
              hinText: "Senha",
              isConfirm: true,
            ),
          ),
          const SizedBox(height: 70.0),
          SizedBox(
            width: widget.width * 0.8,
            child: TextfieldButtonWidget(
              width: widget.width,
              formKey: getFormKey,
              nameButton: 'Cadastrar',
              isFill: false,
              padromColor: CustomColor().getCorPadraoAzul,
              isButtonPage: false,
              isBVPage: true,
            ),
          ),
        ],
      ),
    );
  }
}
