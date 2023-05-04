////////UserCard
/*class UserCard {
  String? id;
  String? niveau;
  String? position;
  MyCard card;

  UserCard({
    this.id,
    this.niveau,
    this.position,
    required this.card,
  });

  factory UserCard.fromJson(Map<String, dynamic> json) {
    return UserCard(
      id: json['_id'],
      niveau: json['niveau'],
      position: json['position'],
      card: json['card'] != null ? MyCard.fromJson(json['card']) : MyCard(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'niveau': niveau,
      'position': position,
      'card': card.toJson(),
    };
  }
}


////////////////User

class User {
  final String? id;
 final String? firstname;
  final String? lastname;
  final String? email;
  final String? phoneNumber;
  final DateTime? birthday;
  final String? password;
  final  String? image;
  final  int? coins;
  final  int? steps;
  final  String? role;

  /*String? Sho;
  String? Pac;
  String? Dri;
  String? Pas;
  int? niveau;*/

   User({
    this.id,
     this.firstname,
    this.lastname,
    this.email,
    this.birthday,
    this.image,
    this.password,
    this.phoneNumber,
    this.coins,
    this.role,
    this.steps,
    /*this.Dri,
    this.Pac,
    this.Pas,
    this.Sho,
    this.niveau*/
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstname: json['firstname'],
      image: json['image'],
      steps: json['steps'],
      role: json['role'],
      coins: json['coins'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      birthday: json['birthday'],
      email: json['email'],
      lastname: json['lastname'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstname': firstname,
      'image': image,
      'lastname': lastname,
      'email': email,
       'birthday':birthday,
      'password':password,
      'coins':coins,
      'steps':steps,
      'role':role,
      'phoneNumber':phoneNumber,
    };
  }
}

/////////////////Card

class MyCard {
   String? id;
   String? name;
    String? image;
    int? rating;
    String? link;
  /*String? Sho;
  String? Pac;
  String? Dri;
  String? Pas;
  int? niveau;*/

   MyCard({
    this.id,
    this.name,
    this.image,
    this.rating,
    this.link,
    /*this.Dri,
    this.Pac,
    this.Pas,
    this.Sho,
    this.niveau*/
  });

  factory MyCard.fromJson(Map<String, dynamic> json) {
    return MyCard(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      rating: json['rating'],
      link: json['link'],
      /* Pas:json['Pas'],
      Pac:json['Pac'],
      Dri:json['Dri'],
      Sho:json['Sho'],
      niveau:json['niveau'],*/
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'rating': rating,
      'link': link,
      /* 'Sho':Sho,
      'Pas':Pas,
      'Dri':Dri,
      'Pac':Pac,
      'niveau':niveau,*/
    };
  }
}
*/