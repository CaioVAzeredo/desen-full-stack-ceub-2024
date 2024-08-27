import 'package:flutter/material.dart';
import 'package:primeiro_projeto/detalhe_receita_page.dart';
import 'package:primeiro_projeto/model/receita_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ReceitaHome();
  }
}

class ReceitaHome extends StatefulWidget {
  const ReceitaHome({super.key});

  @override
  State<ReceitaHome> createState() => _ReceitaHomeState();
}

class _ReceitaHomeState extends State<ReceitaHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Receita Home",
      theme: ThemeData().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Receita"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: ReceitaModel.listaReceita.length,
          itemBuilder: (context, index) {
            var receita = ReceitaModel.listaReceita[index];
            return CardReceitaWidget(receita: (receita));
          },
        )),
      ),
    );
  }
}

class CardReceitaWidget extends StatelessWidget {
  final ReceitaModel receita;

  const CardReceitaWidget({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetalheReceitaPage(
            receitaModel: receita,
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.all(16),
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              Container(
                  width: double.maxFinite,
                  height: 150,
                  //child: Image.network(receita.urlImg,fit: BoxFit.cover,),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child: Image.asset(receita.assetImg, fit: BoxFit.cover),
                  )),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(receita.nome,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.redAccent)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReceitaApp extends StatelessWidget {
  const ReceitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.lightGreen,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Clique para aumentar',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
