import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: unused_import

import 'package:sports_zone/data/models/leagues_model/legues_model.dart';

class LeaguesModelsRepo {
  static const String _apiKey =
      'fe9544088a8fcbb45f8da6dffe1484bb51229789c190eefe695ff6883fe7625f';
  static const String _baseUrl = 'https://apiv2.allsportsapi.com/football/';
  Future<Zsc?> getLeaguesModels(int countryId) async {
    try {
      var response = await http.get(Uri.parse(
          "$_baseUrl?met=Leagues&countryId=$countryId&APIkey=$_apiKey"));

      Map<String, dynamic> deCodedResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        Zsc data = Zsc.fromJson(deCodedResponse);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
