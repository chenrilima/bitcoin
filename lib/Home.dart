import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:bitcoin/Home.dart';
import 'package:bitcoin/valor.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preço - Bitcoin"),
        backgroundColor: Colors.green[300],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/images/bitcoin.png'),
              Padding(
                padding: EdgeInsets.only(top: 90, bottom: 40),
                child: Text("Saiba os valores da Moeda!",
                    style: TextStyle(
                      fontSize: 25,
                    )),
              ),
              RaisedButton(
                color: Colors.green[300],
                highlightColor: Colors.yellow,
                child: Text("Acessar",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Valor(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
