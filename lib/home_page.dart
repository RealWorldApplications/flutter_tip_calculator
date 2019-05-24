import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var billTotal = 0.0;
  var bill = 0.0;
  var _radioValue = 1;
  var _suggestedAmt = 15;
  var _height = 30.0;
  var _width = 50.0;
  var _color = Colors.green;
  var _shape = BoxShape.circle;

  final formatCurrency = NumberFormat.simpleCurrency();


  var controllerBill = new MoneyMaskedTextController(
      precision: 2,
      leftSymbol: '\$ ',
      decimalSeparator: '.',
      thousandSeparator: ',');

  void _handleAmtChanged() {
    setState((){
        _color = _color == Colors.green ? Colors.lightGreen : Colors.green;
        _height = _height == 30 ? 40 : 30;
        _width = _width == 30 ? 40 : 30;
    });
    bill = controllerBill.numberValue;
    billTotal = (bill * (_suggestedAmt * .01)) + bill;
  }

  void _handleTipChanged(int amount) {
    setState(() {
      _radioValue = amount;
      switch (_radioValue) {
        case 0:
          _suggestedAmt = 10;
          break;
        case 1:
          _suggestedAmt = 15;
          break;
        case 2:
          _suggestedAmt = 20;
          break;
      }
      _handleAmtChanged();
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Tip Calculator"),
      ),
      body: new Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: _height,
                  width: _width,
                  curve: Curves.bounceInOut,
                  decoration: BoxDecoration(
                    shape: _shape,
                    color: _color,

                  ),
                  child: Image.asset(
                    'assets/dollarsign.png',
                    height: 30.0,
                  ),
                ),

              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Row(children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: _handleTipChanged,
                  ),
                  new Text(
                    '10% Crappy',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ]),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleTipChanged,
                    ),
                    new Text(
                      '15% Average',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleTipChanged,
                    ),
                    new Text(
                      '20% Above Average',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    "Bill Amount: ",
                    style: Theme.of(context).textTheme.display2,
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: Theme.of(context).textTheme.display2,
                    controller: controllerBill,
                    onSubmitted: (value) {
                      _handleTipChanged(_radioValue);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.0),
            ),

            Text(
              '${formatCurrency.format(billTotal)}',
              style: Theme.of(context).textTheme.headline,
            ),
          ],
        ),
      ),
    );
  }
}
