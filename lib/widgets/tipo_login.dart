import 'package:flutter/material.dart';

class TipoLogin extends StatefulWidget {
  final List<bool> tipoLogin;
  final Function(int) onPressed;

  const TipoLogin({
    super.key,
    required this.tipoLogin,
    required this.onPressed,
  });

  @override
  State<TipoLogin> createState() => _TipoLoginState();
}

class _TipoLoginState extends State<TipoLogin> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Logar com: '),
        SizedBox(width: 8),
        ToggleButtons(
          borderRadius: BorderRadius.circular(10),
          borderColor: Colors.blue,
          selectedBorderColor: Colors.blue,
          isSelected: widget.tipoLogin,
          onPressed: widget.onPressed,
          children: [Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("E-Mail"),
          ), 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("CPF"),
          ), 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Telefone"),
          )],
        ),
      ],
    );
  }
}
