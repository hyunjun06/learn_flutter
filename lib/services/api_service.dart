import 'dart:convert';
import 'package:http/http.dart';
import 'package:learn_flutter/models/webtoon_model.dart';

class ApiService {
  static const String _baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev/';
  static const String today = 'today';

  static Future<List> getTodaysToons() async {
    final uri = Uri.parse('$_baseUrl$today');
    final response = await get(uri);

    if (response.statusCode == 200) {
      final webtoonInstances = <WebtoonModel>[];
      final json = response.body;
      final List<dynamic> webtoonList = jsonDecode(json);

      for (final webtoon in webtoonList) {
        final webtoonInstance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(webtoonInstance);
      }

      return webtoonInstances;
    }

    throw Error();
  }
}
