import 'package:market_place/View/marketplace.dart';
import 'package:market_place/ViewModel/CardViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/ViewModel/UserCardViewModel.dart';
import 'package:market_place/common/theme_helper.dart';
import 'package:market_place/main.dart';
import 'package:market_place/models/market.dart';


class Usercard extends StatefulWidget{
  const Usercard({Key? key}) : super(key: key);
  @override
  _UsercardState createState() => _UsercardState();
}

class _UsercardState extends State<Usercard> {
  final UserCardViewModel _userCardViewModel = UserCardViewModel();
  List<UserCard> _usercardList = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /*List<Market> _filteredMarketplaceList = [];
  String _searchQuery = '';*/


  @override
  void initState() {
    super.initState();
    _getUsercard();
  }

  void _getUsercard() async {
    List<UserCard> cards = (await _userCardViewModel
        .get()).cast<UserCard>();
    setState(() {
      _usercardList = cards;
      // _filteredMarketplaceList = cards;
    });
  }

  Future<void> _refreshCards() async {
    // Perform any async operation to refresh the data
    // For example, fetch data from an API
    await Future.delayed(Duration(seconds: 2));
    _getUsercard();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cards'),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
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
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshCards,
                child: GridView.builder(
                  itemCount: _usercardList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 75.0,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    UserCard userCard = _usercardList[index];
                    return GestureDetector(
                      child: Opacity(
                        opacity: 0.9,
                        child: Card(
                          elevation: 6.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                child: Image.network(
                                  '${userCard.card.image}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Player name: ${userCard.card.name}',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    ElevatedButton(
                                      child: Text('Add to Marketplace'),
                                      onPressed: () async {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            double price = 0.0;
                                            return AlertDialog(
                                              title: Text("Add to Marketplace"),
                                              content: TextFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'Price',
                                                ),
                                                keyboardType: TextInputType.number,
                                                onChanged: (value) {
                                                  price = double.tryParse(value) ?? 0.0;
                                                },
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text("Cancel"),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text("Add"),
                                                  onPressed: () async {
                                                  UserCardViewModel().addCardToMarketplace(Market(user_card: userCard,price: price));
                                                    }

                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
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