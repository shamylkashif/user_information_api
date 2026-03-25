class UserModel {
  final int id;
  final String name;
  final String email;
  final String street;
  final String city;
  final String zipcode;
  final String phone;
  final String companyName;

  UserModel(
  {
    required this.id,
    required this.name,
    required this.email,
    required this.street,
    required this.city,
    required this.zipcode,
    required this.phone,
    required this.companyName
});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        street: json['street'],
        city: json['city'],
        zipcode: json['zipcode'],
        phone: json['phone'],
        companyName: json['companyName'],
    );
  }
}