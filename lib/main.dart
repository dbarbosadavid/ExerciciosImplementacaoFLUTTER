import 'classes/login_details.dart';
import 'widgets/login_text_field.dart';
import 'widgets/tipo_login.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(const MyApp());
}

class BoasVindas extends StatelessWidget{
  final String user;
  final Function nav;
 

  const BoasVindas({super.key, required this.user, required this.nav});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Bem vindo $user")],
        ),
      ),
      bottomNavigationBar: nav(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _userController;
  late TextEditingController _senhaController;
  TiposLogin _tipoCampoLogin = TiposLogin.email;
  int _itemSelecionado = 0;
  var _senhaEscondida = true;
  String text = '';

  var _tipoLogin = [true, false, false];

  void _alterarTipoLogin(int idx) {
    setState(() {
      _tipoCampoLogin = TiposLogin.values[idx];
      _tipoLogin =
          _tipoLogin.mapIndexed((indice, chave) => indice == idx).toList();

      _userController.text = '';
    });
  }

  BottomNavigationBar bottomNavigationBar(){
    return BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(label: 'Dashboard', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Disciplinas', icon: Icon(Icons.menu_open)),
          BottomNavigationBarItem(label: 'Sair', icon: Icon(Icons.logout)),
        ],
        currentIndex: _itemSelecionado,
        onTap: (idx) {
          setState(() {
            if (idx == 2) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Aviso'),
                    content: Text('Tem certeza que deseja sair?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Fecha o diálogo
                        },
                      ),
                      TextButton(
                        child: Text('Confirmar'),
                        onPressed: () {
                          Navigator.pop(context); 
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                        },
                      ),
                    ],
                  );
                },
              );
            }
            _itemSelecionado = idx;
          });
        },
      );
  }

  void _logar() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _senhaController.text == 'admin') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BoasVindas(user: _userController.text, nav: bottomNavigationBar)),
        );
      } else {
        text = 'Erro, tente novamente!';
      }
    });
  }

  void _alterarVisibilidade() {
    setState(() {
      _senhaEscondida = !_senhaEscondida;
    });
  }

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _senhaController = TextEditingController();
  }

  @override
  void dispose() {
    _userController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(width: 150, "assets/images/calcIcon.png"),
              SizedBox(height: 48),
              TipoLogin(tipoLogin: _tipoLogin, onPressed: _alterarTipoLogin),
              SizedBox(height: 16),
              LoginTextField(
                controller: _userController,
                tipoLogin: _tipoCampoLogin,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _senhaController,
                obscureText: _senhaEscondida,
                decoration: InputDecoration(
                  label: Text("Senha"),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: _alterarVisibilidade,
                    icon: Icon(
                      _senhaEscondida ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(text)
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _logar,
                child: Center(child: Text("Login")),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar()
    );
  }
}
