class Model {
  String name;
  String lastName;
  String email;
  String password;

  Model({
    this.name,
    this.lastName,
    this.email,
    this.password,
  });

  Model.fromMap(Map map)
      : this.name = map['name'],
        this.lastName = map['lastName'],
        this.email = map['email'],
        this.password = map['password'];

  Map toMap() {
    return {
      'name': this.name,
      'lastName': this.lastName,
      'email': this.email,
      'password': this.password,
    };
  }
}
