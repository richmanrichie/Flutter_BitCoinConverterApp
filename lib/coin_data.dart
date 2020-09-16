import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String coinUrl = 'https://rest.coinapi.io/v1/exchangerate';
  String apiKey = '05E6C85C-4602-4BB5-870B-16105F152391';

  Future<dynamic> getCoinRate({@required currency, @required coin}) async {
    Map<String, String> headers = {"X-CoinAPI-Key": apiKey};
    Response response = await get('$coinUrl/$coin/$currency', headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    }  else {
      print(response.body);
      return null;
    }
  }

}
