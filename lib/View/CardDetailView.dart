import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_place/models/marketplace.dart';
import 'package:market_place/models/market.dart';

import '../models/card.dart';
import '../models/marketplace.dart';
import '../models/marketplace.dart';

class CardDetailsScreen extends StatelessWidget {
  //final MyCard card;
  final Market marketplace;


  const CardDetailsScreen({Key? key, required this.marketplace})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('${marketplace.user_card.card.name}'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  '${marketplace.user_card.card.image}',
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    // handle image load errors
                    return const Placeholder(
                      fallbackHeight: 200.0,
                      fallbackWidth: double.infinity,
                    );
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    // handle image loading progress
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Player Name: ${marketplace.user_card.card.name}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 4.0),
                      Text('${marketplace.user_card.card.rating}'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: <Widget>[
                      Icon(Icons.person, color: Colors.black),
                      SizedBox(width: 4.0),
                      Text(
                          '${marketplace.user_card.user.firstname} ${marketplace
                              .user_card.user.lastname}'),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
