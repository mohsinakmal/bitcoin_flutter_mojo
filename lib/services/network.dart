import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:bitcoin_flutter_mojo/constants.dart';

class NetworkCall {
  List<String> newItemCount = [];

  Future getExchangeRate() async {
    var url = 'https://rest.coinapi.io/v1/exchangerate/BTC/?$kApiKey';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      //print(jsonResponse);
      var itemCount = jsonResponse["rates"].length;
      newItemCount = itemCount;
      //print(itemCount);
      return itemCount;
    }
  }
}
