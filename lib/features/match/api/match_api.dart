import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as https;
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/models/basket_model.dart';

class MatchApi {
  final String apiKey = 'e0fbe3beaaed6d5b1321d8a9cbeaf93a';
  final String apiHost = 'v3.basketball.api-sports.io';
  final String endpoint = 'fixtures';

  Future<List<BasketModel>> fetchMatches(DateTime dateTime) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String cachedData = prefs.getString('footballCachedData') ?? '';
    if (cachedData.isNotEmpty) {
      final data = json.decode(cachedData);
      await Future.delayed(const Duration(seconds: 1));
      return (data['response'] as List<dynamic>)
          .map((e) => BasketModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    final date = DateFormat('yyyy-MM-dd').format(dateTime);
    final String lastUpdateDate =
        prefs.getString('footballLastUpdateDate') ?? '';
    if (lastUpdateDate != date) {
      final response = await https.get(
        Uri.https(apiHost, endpoint, {'date': date}),
        headers: {
          'x-rapidapi-host': apiHost,
          'x-rapidapi-key': apiKey,
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        await prefs.setString('footballLastUpdateDate', date);
        await prefs.setString('footballCachedData', json.encode(data));
        final matches = (data['response'] as List<dynamic>)
            .map((e) => BasketModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return matches;
      } else {
        throw Exception('Failed to load data');
      }
    } else {
      final String cachedData = prefs.getString('footballCachedData') ?? '';
      if (cachedData.isNotEmpty) {
        final data = json.decode(cachedData);
        return (data['response'] as List<dynamic>)
            .map((e) => BasketModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Cached data is empty');
      }
    }
  }
}
