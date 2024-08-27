import 'package:flutter/material.dart';

import 'model/receita_model.dart';

class DetalheReceitaPage extends StatefulWidget {
  final ReceitaModel receitaModel;
  const DetalheReceitaPage({super.key, required this.receitaModel});

  @override
  State<DetalheReceitaPage> createState() => _DetalheReceitaPageState();
}

class _DetalheReceitaPageState extends State<DetalheReceitaPage> {
  int _medida = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receitaModel.nome),
      ),
      body: SafeArea(
          child: Column(
            children: [
              Image.asset(
                widget.receitaModel.assetImg,
                height: 120,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      var ingrediente = widget.receitaModel.listaIngrediente[index];
                      var qtdIngrediente = ingrediente.quantidade.toInt() * _medida;
                      return ListTile(
                        leading: Icon(
                          Icons.adb_rounded,
                          color: Colors.amber,
                        ),
                        title:
                        Text(" ${qtdIngrediente} ${ingrediente.tipoMedida} • ${ingrediente.nome} "),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.lightGreen,
                    ),
                    itemCount: widget.receitaModel.listaIngrediente.length),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 32),
                child: Slider(
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: "${_medida} Medidas",
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  value: _medida.roundToDouble(),
                  onChanged: (valor) {
                    setState(() {
                      _medida = valor.round();
                    });
                  },
                ),
              )
            ],
          )),
    );
  }
}




