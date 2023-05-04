import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:market_place/models/market.dart';
import 'package:market_place/utils/routes.dart';
import '../Utils/const.dart';
import 'MarketplaceViewModel.dart';


class UserCardViewModel {

  final url = Uri.parse('$base_url/card/cards/64321cbb53786618656e617a');

  Future<List<UserCard>> get() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<UserCard> usercard = data.map((m) => UserCard.fromJson(m))
            .toList();
        return usercard;
      } else {
        throw Exception('Failed to get usercard');
      }
    } catch (error) {
      throw error;
    }
  }



  Future<Market> addCardToMarketplace(Market market) async {
    final url = '$base_url/marketplace/addCard';

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields['price'] = market.price.toString();
    request.fields['user_card'] = market.user_card.id!;
    request.fields['card'] = market.user_card.card.id!;
    request.fields['user'] = market.user_card.user.id!;



    try {
      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        print('ajout avec succès');

        // retrieve updated marketplace data
        List<Market> marketplaceItems = await MarketplaceViewModel().getAllCardsFromMarketplace();

        // find the added card in the marketplace data and return it
        for (Market item in marketplaceItems) {
          if (item.user_card.id == market.user_card.id && item.price == market.price) {
            return item;
          }
        }

        throw Exception("Failed to retrieve added card from marketplace");
      } else {
        print(response.body);
        throw Exception("Failed to add card to marketplace");
      }
    } catch (e) {
      print(e);
      throw Exception("Failed to add card to marketplace");
    }
  }


}

