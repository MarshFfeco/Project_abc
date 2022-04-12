import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class TextfieldButtonWidget extends StatelessWidget {
  const TextfieldButtonWidget(
      {Key? key,
      required this.width,
      required this.formKey,
      required this.nameButton,
      required this.isFill,
      required this.padromColor})
      : super(key: key);

  final width;
  final formKey;
  final bool isFill;
  final Color padromColor;

  final String nameButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: isFill ? Colors.white : padromColor,
        onPrimary: isFill ? padromColor : Colors.white,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        minimumSize: Size(width * 0.8, 70),
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
        if (formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processando informações')),
          );
        }
      },
      child: Text(nameButton),
    );
  }
}
