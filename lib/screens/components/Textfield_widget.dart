import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget(
      {Key? key,
      required this.hinText,
      required this.prefixIcon,
      required this.sufixIcon,
      required this.obscureText,
      required this.textInputType})
      : super(key: key);

  final String hinText;
  final IconData prefixIcon;
  final IconData sufixIcon;
  final bool obscureText;
  final TextInputType textInputType;

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  final _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ]),
      child: TextFormField(
        controller: _myController,
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hinText,
          hintStyle: TextStyle(color: CustomColor().getCorPadraoAzul),
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            widget.prefixIcon,
            color: CustomColor().getCorPadraoAzul,
          ),
          suffix: IconButton(
            icon: Icon(widget.sufixIcon),
            onPressed: () => setState(() => _myController.clear()),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Digite seu email";
          }
          return null;
        },
      ),
    );
  }
}
