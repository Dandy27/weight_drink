import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.amber,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController produtoController = TextEditingController();
  TextEditingController pesoDoLiquidoController = TextEditingController();
  TextEditingController quantDosesController = TextEditingController();
  TextEditingController pesoBrutoController = TextEditingController();
  TextEditingController taraController = TextEditingController();
  TextEditingController pesoGrfAbertaController = TextEditingController();
  // TextEditingController totalController = TextEditingController();

  void _resetField(){
    produtoController.text = '';
    pesoDoLiquidoController.text = '';
    quantDosesController.text = '';
    pesoBrutoController.text = '';
    taraController.text = '';
    pesoGrfAbertaController.text = '';
    // totalController.text = '';
  }

  void _calculate(){
    double peso_liquido = double.parse(pesoDoLiquidoController.text);
    double quant_doses = double.parse(quantDosesController.text);
    double peso_bruto = double.parse(pesoGrfAbertaController.text);
    double tara = double.parse(taraController.text);
    double peso_grf_aberta = double.parse(pesoGrfAbertaController.text);
    double total = (peso_grf_aberta - tara) * quant_doses / (peso_bruto - tara );
    print(total);


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Weight Drinks', style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.blueAccent,
        actions: [IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetField)],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Produto : ',
                  labelStyle: TextStyle(color: Colors.amber),
                  border: OutlineInputBorder(),
                  prefixText: 'nome : '),
              style: TextStyle(color: Colors.white, fontSize: 20),
              controller: produtoController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Peso do liquido : ',
                  labelStyle: TextStyle(color: Colors.amber),
                  border: OutlineInputBorder(),
                  prefixText: 'grs :'),
              style: TextStyle(color: Colors.white, fontSize: 20),
              controller: pesoDoLiquidoController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Quant doses : ',
                  labelStyle: TextStyle(color: Colors.amber),
                  border: OutlineInputBorder(),
                  prefixText: 'Nº :'),
              style: TextStyle(color: Colors.white, fontSize: 20),
              controller: quantDosesController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Peso Bruto : ',
                  labelStyle: TextStyle(color: Colors.amber),
                  border: OutlineInputBorder(),
                  prefixText: 'grs : '),
              style: TextStyle(color: Colors.white, fontSize: 20),
              controller: pesoBrutoController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Tara : ',
                  labelStyle: TextStyle(color: Colors.amber),
                  border: OutlineInputBorder(),
                  prefixText: 'grs : '),
              style: TextStyle(color: Colors.white, fontSize: 20),
              controller: taraController,
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Peso grf aberta : ',
                  labelStyle: TextStyle(color: Colors.amber),
                  border: OutlineInputBorder(),
                  prefixText: 'grs : '),
              style: TextStyle(color: Colors.white, fontSize: 20),
              controller: pesoGrfAbertaController,
            ),
          ],
        ),
      ),
    );
  }
}
