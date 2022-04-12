import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class TextfieldPasswordWidget extends StatefulWidget {
  const TextfieldPasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TextfieldPasswordWidget> createState() =>
      _TextfieldPasswordWidgetState();
}

class _TextfieldPasswordWidgetState extends State<TextfieldPasswordWidget> {
  bool _securityText = true;
  bool isShadow = true;

  set setSecurityText(bool securityText) {
    _securityText = securityText;
  }

  bool get getSecuritytext {
    return _securityText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isShadow
          ? const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  )
                ])
          : const BoxDecoration(),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: getSecuritytext,
        decoration: InputDecoration(
          hintText: 'Senha',
          hintStyle: TextStyle(color: CustomColor().getCorPadraoAzul),
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.key,
            color: CustomColor().getCorPadraoAzul,
          ),
          suffix: IconButton(
            icon:
                Icon(getSecuritytext ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => setSecurityText = !getSecuritytext),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            isShadow = false;
            return "Digite sua senha";
          }
          return null;
        },
      ),
    );
  }
}
