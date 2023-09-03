import 'dart:math';

import 'package:flutter/material.dart';
import 'package:imc_dio/model/imc_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imcClassificacao = "";
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  bool cardVisible = false;

  void calcularImc(double peso, int altura) {
    double total = peso / (altura * altura);
    imcClassificacao = classificacao(total);
    cardVisible = true; // Torna o Card visível
  }

  String classificacao(double valor) {
    if (valor < 18) {
      return "Magreza";
    } else if (valor >= 18 && valor <= 25) {
      return "Normal";
    } else if (valor > 25 && valor < 30) {
      return "Sobrepeso";
    } else if (valor >= 30 && valor < 35) {
      return "Obesidade grau I";
    } else if (valor >= 35 && valor < 40) {
      return "Obesidade grau II";
    } else {
      return "Obesidade grau III";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALCULADORA IMC '),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  TextFormField(
                    controller: _alturaController,
                    decoration: const InputDecoration(
                      labelText: 'Altura (em cm)',
                    ),
                    validator: (value) {
                      if (_alturaController.text.isEmpty) {
                        return "O campo deve ser preenchido";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _pesoController,
                    decoration: const InputDecoration(
                      labelText: 'Peso (em kg)',
                    ),
                    validator: (value) {
                      if (_pesoController.text.isEmpty) {
                        return "O campo deve ser preenchido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        calcularImc(double.parse(_pesoController.text),
                            int.parse(_alturaController.text));

                        setState(() {});
                      },
                      child: const Text(
                        "Calcular",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: cardVisible,
              child: Card(
                child: Text(
                  "Seu IMC é: $imcClassificacao",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
