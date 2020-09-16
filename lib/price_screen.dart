import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';


class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currentValue = 'USD';
  var btcText =  '1 BTC = ? USD';
  var ethText = '1 BTC = ? ETH';
  var ltcText = '1 BTC = ? LTC';

  void getExchange() async {
    CoinData coinData = CoinData();
    var btcRate = await coinData.getCoinRate(currency: currentValue, coin: 'BTC');
    var ethRate = await coinData.getCoinRate(currency: currentValue, coin: 'ETH');
    var ltcRate = await coinData.getCoinRate(currency: currentValue, coin: 'LTC');
    if(btcRate && ethRate && ltcRate) {
      setState(() {
        btcText = '1 BTC = ${btcRate['rate']} USD';
        ethText = '1 ETH = ${ethRate['rate']} USD';
        ltcText = '1 BTC = ${ltcRate['rate']} LTC';
      });
    }

  }

  List<Widget> getCoinDisplay() {
    List<Text> coidD= [];

    for(String coin in cryptoList) {
      coidD.add( Text(
          btcText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          )
      )
      );
    }

    return coidD;
  }

  DropdownButton getDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    return DropdownButton(
      value: 'USD',
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          currentValue = value;
          getExchange();
        });
      },
    );
  }

  CupertinoPicker getPicker() {
    List<Widget> pickerItems = [];
    for(String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return  CupertinoPicker(
        itemExtent: 32.0,
        backgroundColor: Colors.lightBlue,
        onSelectedItemChanged: (value) {
          setState(() {
            currentValue = currenciesList[value];
            getExchange();
          });
        },
        children: pickerItems
    );
  }


  @override
  Widget build(BuildContext context) {
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
                  btcText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
                  btcText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
                  btcText,
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
            child: Platform.isIOS ? getPicker() : getDropDownButton(),
          ),
        ],
      ),
    );
  }
}
