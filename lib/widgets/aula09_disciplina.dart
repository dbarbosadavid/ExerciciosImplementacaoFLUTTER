import 'package:flutter/material.dart';
import 'package:ex_aula_09/classes/disciplina.dart';
import 'package:ex_aula_09/widgets/disciplina_card.dart';

class Aula09Disciplina extends StatelessWidget {
  Aula09Disciplina({super.key});

  final List<Disciplina> disciplinas = Disciplina.gerarDisciplinas();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: disciplinas.length,
      itemBuilder: (context, index){
        return DisciplinaCard(disciplina: disciplinas[index]);
      }
    );
  }
}