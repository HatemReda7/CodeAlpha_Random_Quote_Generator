import 'dart:convert';
import 'package:codealpha_random_quote_generator/Models/QuoteResponse.dart';
import 'package:codealpha_random_quote_generator/Shared/Components/constants.dart';
import 'package:http/http.dart' as http;

class ApiManager{

  static Future<QuoteResponse> getQuote()async{
    Uri url = Uri.https(baseUrl, "/v1/quotes",
        {
          "X-Api-Key": ApiKey,
        }
    );
    http.Response response=await http.get(url);
    var jsonData= jsonDecode(response.body);
    QuoteResponse quoteResponse=QuoteResponse.fromJson(jsonData);
    return quoteResponse;
  }
}