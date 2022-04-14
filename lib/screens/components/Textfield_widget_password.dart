import 'package:fadba/Control/Controller.dart';
import 'package:fadba/screens/components/Textfield_widget_confirmpass.dart';
import 'package:flutter/material.dart';

import '../../values/Custom_color.dart';

class TextfieldPasswordWidget extends StatefulWidget {
  const TextfieldPasswordWidget({
    Key? key,
    required this.hinText,
    required this.isConfirm,
  }) : super(key: key);

  final String hinText;
  final isConfirm;

  @override
  State<TextfieldPasswordWidget> createState() =>
      _TextfieldPasswordWidgetState();
}

class _TextfieldPasswordWidgetState extends State<TextfieldPasswordWidget> {
  late final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool _securityText = true;

  set setSecurityText(bool securityText) {
    _securityText = securityText;
  }

  bool get getSecuritytext {
    return _securityText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                )
              ]),
          child: TextFormField(
            controller: widget.isConfirm ? _pass : null,
            keyboardType: TextInputType.visiblePassword,
            obscureText: getSecuritytext,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20.0),
              hintText: widget.hinText,
              hintStyle: TextStyle(color: CustomColor().getCorPadraoAzul),
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
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.key,
                color: CustomColor().getCorPadraoAzul,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  getSecuritytext ? Icons.visibility_off : Icons.visibility,
                  color: CustomColor().getCorPadraoAzul,
                ),
                onPressed: () =>
                    setState(() => setSecurityText = !getSecuritytext),
              ),
            ),
            validator: (value) {
              var retorno;
              Controller controle = Controller();

              retorno = controle.ValidatorText(value);

              if (retorno) {
                return null;
              } else {
                return "Campo vazio";
              }
            },
          ),
        ),
        widget.isConfirm ? const SizedBox(height: 20.0) : const SizedBox(),
        widget.isConfirm
            ? TextfieldConfirmPassWidget(
                hinText: "Repetir Senha",
                pass: _pass,
              )
            : SizedBox(
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Esqueci a senha"),
                    ));
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("Esqueci a senha?",
                        style:
                            TextStyle(color: CustomColor().getCorPadraoAzul)),
                  ),
                ),
              ),
      ],
    );
  }
}
