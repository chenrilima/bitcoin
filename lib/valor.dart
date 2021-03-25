import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:bitcoin/Home.dart';

class Valor extends StatefulWidget {
  @override
  _ValorState createState() => _ValorState();
}

class _ValorState extends State<Valor> {
  String _preco = "";

  void _recuperarPreco() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });
  }

  void _limparCampos() {
    setState(() {
      _preco = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text("Preço - Bitcoin"),
        shadowColor: Colors.yellow,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _limparCampos,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/images/bitcoin.png'),
              Padding(
                padding: EdgeInsets.only(top: 60, bottom: 30),
                child: Text("R\$" + _preco,
                    style: TextStyle(
                      fontSize: 35,
                    )),
              ),
              RaisedButton(
                highlightColor: Colors.yellow,
                child: Text("Atualizar",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                color: Colors.green[300],
                padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                onPressed: _recuperarPreco,
              )
            ],
          ),
        ),
      ),
    );
  }
}
