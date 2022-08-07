import 'package:flutter/material.dart';

void main() {
  runApp(uygulamam());
}

class uygulamam extends StatelessWidget {
  const uygulamam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Basit mesajlaşma uygulaması'),
        ),
        body: iskelet(),
      ),
    );
  }
}

class iskelet extends StatefulWidget {
  const iskelet({Key? key}) : super(key: key);

  @override
  State<iskelet> createState() => _iskeletState();
}

class _iskeletState extends State<iskelet> {
  TextEditingController t1 = TextEditingController(); //textfield için

  List _mesajlistesi = []; //gelen mesajları listeye aktarıyoruz

  mesajekle() {
    setState(() {
      _mesajlistesi.insert(0, t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40.0),
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true, //mesajları tersten yazdırıyor.
              itemCount: _mesajlistesi.length,
              itemBuilder: (context, indeksNumarasi) =>
                  Text(_mesajlistesi[indeksNumarasi]),
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: t1,
                ),
              ),
              RaisedButton(
                color: Colors.teal,
                  onPressed: mesajekle,
                  child: Text('Gönder',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
