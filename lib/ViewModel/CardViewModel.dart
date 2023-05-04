import 'dart:convert';

import 'package:market_place/Utils/const.dart';
/*import 'package:market_place/models/card.dart';
import 'package:http/http.dart' as http;


class CardsViewModel {
  final url = Uri.parse('$base_url/card/');

  Future<List<MyCard>> getAllCards() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<MyCard> cards = data.map((card) => MyCard.fromJson(card)).toList();
        return cards;
      } else {
        throw Exception('Failed to get users');
      }
    } catch (error) {
      throw error;
    }
  }
}*/