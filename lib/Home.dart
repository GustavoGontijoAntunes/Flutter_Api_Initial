import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarCEP() async {
    String url = "https://viacep.com.br/ws/31170710/json/";
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    String rua = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String cidade = retorno["localidade"];
    String estado = retorno["uf"];

    print("Retorno\nRua: ${rua}\nBairro: ${bairro}\nCidade: ${cidade}(${estado})");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "API de CEP",
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => _recuperarCEP,
            child: Text(
              "Consultar CEP",
            ),
          ),
          Text("Dados"),
        ],
      ),
    );
  }
}
