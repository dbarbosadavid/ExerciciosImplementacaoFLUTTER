import 'package:ex_aula_09/widgets/aula09_disciplina.dart';
import 'package:flutter/material.dart';
import './aula09_dashboard.dart';

class Aula09 extends StatefulWidget {
  final String nomeUsuario;

  const Aula09({super.key, required this.nomeUsuario});

  @override
  State<Aula09> createState() => _Aula09State();
}

class _Aula09State extends State<Aula09> {
  int _paginaSelecionada = 0;

  late List<Widget> _telas;

  @override
  void initState() {
    super.initState();
    _telas = [
      Aula09Dashboard(nomeUsuario: widget.nomeUsuario),
      Aula09Disciplina(),
    ];
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Deseja realmente sair?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.of(context).pop();
              },
              child: const Text('Sair'),
            )
          ],
        ),
      );
    } else {
      setState(() {
        _paginaSelecionada = index;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {},
      child: Scaffold(
        body:Center(
          child: _telas[_paginaSelecionada],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 147),
          selectedItemColor: Color.fromARGB(255, 36, 146, 236),
          items: const [
            BottomNavigationBarItem(label: 'Dashboard',icon: Icon(Icons.home), backgroundColor: Colors.amberAccent),
            BottomNavigationBarItem(label: 'Disciplinas', icon: Icon(Icons.menu_open)),
            BottomNavigationBarItem(label: 'Sair', icon: Icon(Icons.logout)),
          ],
          currentIndex: _paginaSelecionada,
          onTap: _onItemTapped
        ),
      ),
    );
  }
}