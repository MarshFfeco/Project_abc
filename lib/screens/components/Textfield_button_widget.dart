import 'package:fadba/screens/SignUp/Signup_screen.dart';
import 'package:flutter/material.dart';

class TextfieldButtonWidget extends StatelessWidget {
  const TextfieldButtonWidget(
      {Key? key,
      required this.width,
      required this.formKey,
      required this.nameButton,
      required this.isFill,
      required this.padromColor,
      required this.isButtonPage,
      required this.isBVPage})
      : super(key: key);

  final width;
  final formKey;
  final bool isFill;
  final Color padromColor;
  final bool isButtonPage;
  final bool isBVPage;

  final String nameButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isFill ? Colors.white : padromColor,
        onPrimary: isFill ? padromColor : Colors.white,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        minimumSize: Size(width, 100),
        shape: isFill
            ? StadiumBorder(
                side: BorderSide(
                  width: 4,
                  color: padromColor,
                ),
              )
            : const StadiumBorder(),
      ),
      onPressed: () {
        if (isButtonPage) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()));
        } else if (isButtonPage == false && isBVPage == false) {
          if (formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processando informações')),
            );
          }
        } else if (isBVPage) {
          if (formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cadastro realizado com sucesso')),
            );
            Navigator.pop(context);
          }
        }
      },
      child: Text(nameButton),
    );
  }
}
