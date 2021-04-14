import 'package:calculadora/controladores/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculadora'),
       actions: <Widget>[         
         new IconButton(icon: new Icon(Icons.share),
            onPressed: (){Share.share('Conheça meu App https://play.google.com/store/apps/details?id=com.miui.calculator');},
          ),
        ],
      ),
      backgroundColor: Color(0xff00bcd9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _showCalculos(operacoes: _controller.operacoes),
          _buildDisplay(result: _controller.result),
          Divider(color: Colors.black),
          _buildKeyboard(),
        ],
      ),
    );
  }

  _buildKeyboard() {
    return Container(
      height: 400,
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: 'AC', color: Colors.deepOrange),
                _buildButton(label: 'DEL', color: Colors.deepOrange),
                _buildButton(label: '%', color: Colors.deepOrange),
                _buildButton(label: '/', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '7'),
                _buildButton(label: '8'),
                _buildButton(label: '9'),
                _buildButton(label: 'x', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '4'),
                _buildButton(label: '5'),
                _buildButton(label: '6'),
                _buildButton(label: '+', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '1'),
                _buildButton(label: '2'),
                _buildButton(label: '3'),
                _buildButton(label: '-', color: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '0', flex: 2),
                _buildButton(label: ','),
                _buildButton(label: '=', color: Colors.deepOrange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDisplay({String result}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        alignment: Alignment.bottomRight,
        child: Text(
          result,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black,
            fontSize: 50,
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  _buildButton({String label, int flex = 1, Color color = Colors.white}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: Colors.black,
        child: Text(
          label ?? '',
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            _controller.applyCommand(label);
          });
        },
      ),
    );
  }
  
  _showCalculos({String operacoes}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
        alignment: Alignment.bottomRight,
        child: Text(
          operacoes,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'DancingScript',
            fontSize: 25,
            fontWeight: FontWeight.w300,
          )
        )
      )
    );
  }

}
