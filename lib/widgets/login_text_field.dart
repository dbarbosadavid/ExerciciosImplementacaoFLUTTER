import 'package:flutter/material.dart';
import '../classes/login_details.dart';

class LoginTextField extends StatefulWidget {
  final TextEditingController controller;
  final TiposLogin tipoLogin;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.tipoLogin,
  });

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    final loginMap = LoginDetails.loginDetails();

    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        label: Text(loginMap[widget.tipoLogin]!.label),
        hintText: loginMap[widget.tipoLogin]!.hint,
        prefix: loginMap[widget.tipoLogin]!.prefixIcon,
        border: OutlineInputBorder(),
      ),
    );
  }
}
