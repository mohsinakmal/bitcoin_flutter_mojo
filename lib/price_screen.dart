import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  List<DropdownMenuItem> getCurrency(){

   List<DropdownMenuItem<String>> dropDownItems = [];

    for(String currency in currenciesList){
      //print(currency);
      var itemsList = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(itemsList);
    }
    return dropDownItems;
  }

  List<Widget> getCupertinoItems(){

    List<Widget> cupertinoItems = [];

    for(String getCurrency in currenciesList){
      var widgetList = Text(getCurrency);
      cupertinoItems.add(widgetList);
    }
    return cupertinoItems;
  }

  String selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    getCurrency();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedIndex){
                print(selectedIndex);
              },
              children: getCupertinoItems(),
            ),
          ),
        ],
      ),
    );
  }
}

// DropdownButton<String>
// (
// value: selectedCurrency,
// items: getCurrency(),
// onChanged: (value){
// setState(() {
// selectedCurrency = value;
// });
//
// },
// ),