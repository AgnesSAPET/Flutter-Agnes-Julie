class Users {
  final String name, firstname, city, email;

  Users({
    this.name,
    this.firstname,
    this.city,
    this.email,
  });

  fromJson(json) {
    return Users(
      name: json['name'],
      firstname: json['firstname'],
      city: json['city'],
      email: json['email'],
    );
  }
}

class ItemArguments {
  final String text;
  ItemArguments({this.text});
}
