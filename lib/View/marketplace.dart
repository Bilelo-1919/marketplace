import 'package:market_place/View/UserCard.dart';
import 'package:market_place/ViewModel/CardViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/common/theme_helper.dart';
import 'package:market_place/ViewModel/MarketplaceViewModel.dart';
import 'package:market_place/models/marketplace.dart';
import 'package:market_place/models/market.dart';
import 'package:market_place/utils/routes.dart';
import '../models/card.dart';
import 'CardDetailView.dart';

class Marketplace extends StatefulWidget{
  @override
  _MarketplaceState createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  final MarketplaceViewModel _marketplaceViewModelViewModel = MarketplaceViewModel();
  List<Market> _marketplaceList = [];
  List<Market> _filteredMarketplaceList = [];
  String _searchQuery = '';






  @override
  void initState() {
    super.initState();
    _getMarketplace();
  }

  void _getMarketplace() async {
    List<Market> cards = (await _marketplaceViewModelViewModel
        .getAllCardsFromMarketplace()).cast<Market>();
    setState(() {
      _marketplaceList = cards;
      _filteredMarketplaceList = cards;
    });
  }

  Future<void> _refreshCards() async {
    // Perform any async operation to refresh the data
    // For example, fetch data from an API
    await Future.delayed(Duration(seconds: 2));
    _getMarketplace();
  }

  void _handleSearch(String query) {
    setState(() {
      _searchQuery = query;
      _filteredMarketplaceList = _marketplaceList.where((market) =>
      market.user_card.card.name?.toLowerCase()?.contains(
          _searchQuery?.toLowerCase() ?? '') ?? false
      ).toList();
    });
  }
  String _sortOrder = 'PriceAsc'; // default sorting order
  void _sortList() {
    setState(() {
      switch (_sortOrder) {
        case 'PriceAsc':
          _filteredMarketplaceList.sort((a, b) => (a.price ?? 0).compareTo(b.price ?? 0));
          break;
        case 'PriceDesc':
          _filteredMarketplaceList.sort((a, b) => (b.price ?? 0).compareTo(a.price ?? 0));
          break;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Usercard()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: _handleSearch,
                decoration: InputDecoration(
                  hintText: 'Search by name',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton(
                  value: _sortOrder,
                  onChanged: (String? newValue) {
                    setState(() {
                      _sortOrder = newValue!;
                      _sortList();
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'PriceAsc',
                      child: Text('Sort by price (ascending)'),
                    ),
                    DropdownMenuItem(
                      value: 'PriceDesc',
                      child: Text('Sort by price (descending)'),
                    ),
                  ],
                ),

              ],
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshCards,
                child: GridView.builder(
                  itemCount: _filteredMarketplaceList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 75.0,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    Market market = _filteredMarketplaceList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CardDetailsScreen(marketplace: market),
                          ),
                        );
                      },
                      child: Opacity(
                        opacity: 0.9,
                        child: Card(
                          elevation: 6.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                child: Image.network(
                                  ('${market.user_card.card.image}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      ('Player name: ${market.user_card.card.name}'),
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.star, color: Colors.yellow),
                                        SizedBox(width: 4.0),
                                        Text('${market.user_card.card.rating}'),
                                      ],
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.sports_soccer, color: Colors.black),
                                        SizedBox(width: 4.0),
                                        Text('${market.user_card.niveau}'),
                                      ],
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.switch_access_shortcut_add, color: Colors.black),
                                        SizedBox(width: 4.0),
                                        Text('${market.user_card.position}'),
                                      ],
                                    ),
                                    SizedBox(height: 8.0),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.money, color: Colors.green),
                                        SizedBox(width: 4.0),
                                        Text('${market.price}'),
                                      ],
                                    ),

                                    SizedBox(height: 8.0),
                                    Container(
                                      decoration: ThemeHelper().buttonBoxDecoration(context),
                                      child: ElevatedButton(
                                        style: ThemeHelper().buttonStyle(),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                          child: Text(
                                            "BUY".toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          _marketplaceViewModelViewModel.BuyCardFromMarketplace();
                                          // Gérer l'action de l'utilisateur ici
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}