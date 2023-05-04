import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:market_place/models/marketplace.dart';
import 'package:market_place/models/market.dart';

import '../Utils/const.dart';

class MarketplaceViewModel {
  final url = Uri.parse('$base_url/marketplace/getCards/');

  Future<List<Market>> getAllCardsFromMarketplace() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<Market> marketplaces = data.map((m) => Market.fromJson(m))
            .toList();
        return marketplaces;
      } else {
        throw Exception('Failed to get marketplace');
      }
    } catch (error) {
      throw error;
    }
  }

  final urll = Uri.parse('$base_url/marketplace/buyCard/64321235e492d9e7f681e4b6/64321cbb53786618656e617a');

  Future<List<Market>> BuyCardFromMarketplace() async {
    try {
      final response = await http.get(urll);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<Market> marketplaces = data.map((m) => Market.fromJson(m))
            .toList();
        return marketplaces;
      } else {
        throw Exception('Failed to get marketplace');
      }
    } catch (error) {
      throw error;
    }
  }



  /*Future<List<Market>> getMarketplace() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<Market> marketplaces = data.map((m) => Market.fromJson(m)).toList();
        return marketplaces;
      } else {
        throw Exception('Failed to get marketplace');
      }
    } catch (error) {
      throw error;
    }
  }*/
}