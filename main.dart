import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Pawan Calculator',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: MyCalc(),
    ));

class MyCalc extends StatefulWidget {
  @override
  _MyCalcState createState() => _MyCalcState();
}

class _MyCalcState extends State<MyCalc> {
  var _operation = ['Add', 'Subtract', 'Multiply', 'Divide'];
  var _values = 'Add';
  var _displayText = '';

  TextEditingController textBox1 = TextEditingController();
  TextEditingController textBox2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        //This is our first item in the app i.e. title
        title: Text("Pawan Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.5),
        child: ListView(
          children: <Widget>[
            //This is our second item in the app i.e. dropdown
            DropdownButton<String>(
              value: _values,
              style: textStyle,
              items: _operation.map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _values = value;
                  print('Value changed to $_values');
                });
                // value = _values;
              },
            ),

            //This is our third item in the app i.e input first number field
            TextField(
              controller: textBox1,
              style: textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'First Number',
                  hintText: '99',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.2))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.5),
            ),

            //this is our forth item in the app i.e. input second number field
            TextField(
              controller: textBox2,
              style: textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Second Number',
                  hintText: '99',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.2))),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.5),
            ),

            //this is our fifth item in the app i.e. showing result i.e. label
            Text(
              _displayText,
              style: textStyle,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.5),
            ),
            //this is our last item in the list i.e. calculate and clear button

            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text("Calculate"),
                    onPressed: () {
                      setState(() {
                        _calcResult(_values);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.5),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text("Clear"),
                    onPressed: () {
                      setState(() {
                        _clearAll();
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _clearAll() {
    textBox2.text = '';
    textBox1.text = '';
  }

  void _calcResult(value) {
    var text1 = double.parse(textBox1.text);
    var text2 = double.parse(textBox2.text);
    var _result;

    switch (value) {
      case 'Add':
        _result = text1 + text2;
        _displayText = 'Sum = ' + _result.toStringAsFixed(0);
        break;
      case 'Subtract':
        _result = text1 - text2;
        _displayText = 'Difference = ' + _result.toStringAsFixed(0);
        break;
      case 'Multiply':
        _result = text1 * text2;
        _displayText = 'Product = ' + _result.toStringAsFixed(0);
        break;
      case 'Divide':
        _result = text1 / text2;
        _displayText = 'Quotient = ' + _result.toStringAsFixed(0);
        break;
      default:
        _displayText = 'Something Went Wrong';
    }
  }
}
