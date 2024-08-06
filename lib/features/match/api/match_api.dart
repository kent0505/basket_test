import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/models/basket_model.dart';

class MatchApi {
  final String apiKey = 'aad567230b15af533a80bf5aa13a14cb';
  final String apiHost = 'v1.basketball.api-sports.io';
  final String endpoint = 'games';

  final dio = Dio();

  Future<List<BasketModel>> fetchMatches(DateTime dateTime) async {
    try {
      final response = await dio.get(
        'https://v1.basketball.api-sports.io/games?date=2024-08-01',
        options: Options(
          headers: {
            'x-rapidapi-host': apiHost,
            'x-rapidapi-key': apiKey,
          },
        ),
      );

      log(response.data['response'].toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final List result = response.data['response'];
        log(result.length.toString());
        final data = result.map((item) {
          return BasketModel.fromJson(item);
        }).toList();

        return data;
      } else {
        log('ELSE');
        return [];
      }
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
