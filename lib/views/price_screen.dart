import 'package:bitcoin_flutter_mojo/services/network.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoin_flutter_mojo/constants.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  //String newDollarValue = '';

  DropdownButton<String> androidPicker() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var itemsList = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(itemsList);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Text> cupertinoItems = [];

    for (String getCurrency in currenciesList) {
      var widgetList = Text(getCurrency);
      cupertinoItems.add(widgetList);
    }
    return CupertinoPicker(
      itemExtent: (32.0),
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: cupertinoItems,
    );
  }

  @override
  void initState() {
    super.initState();
    //getDollarRates();
  }

  // void getDollarRates() async {
  //   NetworkCall networkCall = NetworkCall();
  //   var dollarValue = await networkCall.getExchangeRate();
  //   newDollarValue = await dollarValue.toStringAsFixed(2);
  //   print(newDollarValue);
  //   //return newDollarValue;
  // }

  // Widget cardButtons(String currency) {
  //   return Padding(
  //     padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
  //     child: Card(
  //       color: Colors.lightBlueAccent,
  //       elevation: 5.0,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
  //         child: Text(
  //           currency,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontSize: 20.0,
  //             color: Colors.white,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  String selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    NetworkCall newtworkcall = NetworkCall();
    //newtworkcall.getExchangeRate();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC =  Money',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 150.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 30.0),
                color: Colors.lightBlue,
                child: Platform.isIOS ? iosPicker() : androidPicker(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//$newDollarValue $selectedCurrency
