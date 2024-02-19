import 'dart:convert';
import 'package:codealpha_random_quote_generator/Models/QuoteResponse.dart';
import 'package:codealpha_random_quote_generator/Shared/Components/constants.dart';
import 'package:http/http.dart' as http;

import '../../Models/QuoteTesting.dart';

class ApiManager{

  static Future<QuoteResponse> getQuote()async{
    Uri url = Uri.https(baseUrl, "/v1/quotes?",
        {
          "X-Api-Key": ApiKey,
        }
    );
    http.Response response=await http.get(url);
    var jsonData= jsonDecode(response.body);
    QuoteResponse quoteResponse=QuoteResponse.fromJson(jsonData);
    return quoteResponse;
  }

  // static Future<QuoteTesting> getQuote()async{
  //   Uri url = Uri.https('quotes15.p.rapidapi.com', "/quotes/random/",
  //       {
  //         'X-RapidAPI-Key': '32fe6814d2msh462e4831962d1c1p1b66fejsn7c3106a6340c',
  //         'X-RapidAPI-Host': 'quotes15.p.rapidapi.com'
  //       }
  //   );
  //   http.Response response=await http.get(url);
  //   var jsonData= jsonDecode(response.body);
  //   QuoteTesting quoteResponse=QuoteTesting.fromJson(jsonData);
  //   return quoteResponse;
  // }
}