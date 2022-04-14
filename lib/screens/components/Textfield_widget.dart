import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget(
      {Key? key,
      required this.hinText,
      required this.prefixIcon,
      required this.sufixIcon,
      required this.textInputType})
      : super(key: key);

  final String hinText;
  final IconData prefixIcon;
  final IconData sufixIcon;
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            )
          ]),
      child: TextFormField(
        controller: _myController,
        keyboardType: widget.textInputType,
        obscureText: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
              borderRadius: BorderRadius.circular(30)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
              borderRadius: BorderRadius.circular(30)),
          hintText: widget.hinText,
          hintStyle: TextStyle(color: CustomColor().getCorPadraoAzul),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: CustomColor().getCorPadraoAzul,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              widget.sufixIcon,
              color: CustomColor().getCorPadraoAzul,
            ),
            onPressed: () => setState(() => _myController.clear()),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Digite seu ${widget.hinText}";
          }
          return null;
        },
      ),
    );
  }
}
