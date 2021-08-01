import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Calculate Simple Interest',
      home: SIForm(),
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.tealAccent,
      )));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  final _minPad = 5.0;
  TextEditingController prinCon = TextEditingController();
  TextEditingController rateCon = TextEditingController();
  TextEditingController timeCon = TextEditingController();
  var dispText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculate Simple Interest'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.all(_minPad * 2),
              child: ListView(
                children: <Widget>[
                  getImageAsset(),
                  Padding(
                      padding: EdgeInsets.only(top: _minPad, bottom: _minPad),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: prinCon,
                          decoration: InputDecoration(
                              labelText: 'Principle',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(_minPad),
                              )))),
                  Padding(
                      padding: EdgeInsets.only(top: _minPad, bottom: _minPad),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: rateCon,
                          decoration: InputDecoration(
                              labelText: 'Rate Of Interest',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(_minPad),
                              )))),
                  Padding(
                      padding: EdgeInsets.only(top: _minPad, bottom: _minPad),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: timeCon,
                          decoration: InputDecoration(
                              labelText: 'Time',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(_minPad),
                              )))),
                  Padding(
                      padding: EdgeInsets.only(bottom: _minPad, top: _minPad),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            child: Text(
                              'Calculate',
                              textScaleFactor: 1.5,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                              onPrimary: Colors.tealAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                  this.dispText = _calculateAnswer();
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            child: Text(
                              'Reset',
                              textScaleFactor: 1.5,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                              onPrimary: Colors.tealAccent,
                            ),
                            onPressed: () {
                              setState(() {
                                _reset();
                              });
                            },
                          ),
                        )
                      ])),
                  Padding(
                    padding: EdgeInsets.all(_minPad * 2),
                    child: Text(this.dispText),
                  )
                ],
              )),
        ));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/rupee.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minPad * 10),
    );
  }

  String _calculateAnswer() {
    double prin = double.parse(prinCon.text);
    double rate = double.parse(rateCon.text);
    double time = double.parse(timeCon.text);
    double result = prin + (prin * rate * time) / 100;
    String res = 'Amount is $result';
    return res;
  }

  void _reset() {
    prinCon.text = '';
    rateCon.text = '';
    timeCon.text = '';
    dispText = '';
  }
}
