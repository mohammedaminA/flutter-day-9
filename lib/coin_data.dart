import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
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
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'D618BC1F-681E-4EF6-B37E-F6136A330B76';

class CoinData {

  Future getCoinData(String currency) async {
    String requestUrl = '$coinAPIURL/BTC/$currency?apikey=$apiKey';

    http.Response response = await http.get(requestUrl);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var price = decodedData['rate'];
      return price;
    }
    else {
      print(response.statusCode);
    }
  }
}
