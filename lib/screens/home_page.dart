import 'package:calculadora_imc/components/text_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = '';

  void _resetField() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = 'Informe seus dados';
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText = 'Abaixo do peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc <= 24.9) {
        _infoText = 'Peso ideal (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = 'Levemente acima do peso (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = 'Obesidade Grau I (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = 'Obesidade Grau II (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 40) {
        _infoText = 'Obesidade Grau III (${imc.toStringAsPrecision(4)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _resetField();
              }),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.white,
              ),
              TextForm(
                  controller: weightController,
                  labelFieldText: 'Peso (kg)',
                  warningText: 'Informe o peso!'),
              TextForm(
                  controller: heightController,
                  labelFieldText: 'Altura (cm)',
                  warningText: 'Informe sua Altura!'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
                    child: Text('Calcular'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigoAccent,
                      textStyle: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


