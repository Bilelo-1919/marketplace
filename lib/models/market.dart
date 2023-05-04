import 'dart:convert';

import 'package:market_place/models/card.dart';


class Market {
  String? id;
  UserCard user_card;
  double? price;

  Market({
    this.id,
    required this.user_card,
     this.price,
  });

  factory Market.fromJson(dynamic json) {
    if (json is String) {
      json = jsonDecode(json);
    }
    return Market(

      user_card: json['user_card'] != null ? UserCard.fromJson(json['user_card']) :
      UserCard(id:'', card: Player(id: '', name: '', image: '', rating: 0, link: ''),
          user: User(id: '',image: '',birthday: '',coins: 0,email: '',firstname: '',lastname: '',password: '',phoneNumber: '',role: '',steps: 0),
          niveau: 0, position: 0),
      price: json['price']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user_card': user_card.toJson(),
      'price': price,

    };
  }
}

////////////

class UserCard {
  String? id;
  Player card;
  int? niveau;
  int? position;
  User user;

  UserCard({
     this.id,
    required this.card,
     this.niveau,
     this.position,
    required this.user
  });

  factory UserCard.fromJson(Map<String, dynamic> json) {
    return UserCard(
      id: json['_id'],
      card: json['card'] is Map<String, dynamic> ? Player.fromJson(json['card']) : Player.fromJson(json),
      niveau: json['niveau'] ?? 0,
      position: json['position'] ?? 0,
     user: json['user'] is Map<String, dynamic> ? User.fromJson(json['user']) : User.fromJson(json),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'card': card.id,
      'niveau': niveau,
      'position': position,
    //  'user': user.id,
    };
  }
}

/////////////////////

class Player {
  String? id;
  String?name;
  String? image;
  int? rating;
  String? link;

  Player({
     this.id,
     this.name,
     this.image,
     this.rating,
     this.link,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['_id'],
      name: json['name'],
      image: json['image'] ,
      rating: json['rating'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'rating': rating,
      'link': link,
    };
  }
}



class User {
   String? id;
   String? firstname;
   String? lastname;
   String? email;
   String? phoneNumber;
   String? birthday;
   String? password;
   String? image;
   int? coins;
   int? steps;
   String? role;

  User({
     this.id,
     this.firstname,
     this.lastname,
     this.email,
     this.phoneNumber,
    this.birthday,
     this.password,
    this.image,
    this.coins,
    this.steps,
     this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      birthday: json['birthday'] ,
      password: json['password'],
      image: json['image'],
      coins: json['coins'],
      steps: json['steps'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'phoneNumber': phoneNumber,
      'birthday': birthday,
      'password': password,
      'image': image,
      'coins': coins,
      'steps': steps,
      'role': role,
    };
  }
}


