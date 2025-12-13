class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String birthDate;
  final String gender;
  final String image;

  final int age;
  final String bloodGroup;
  final String eyeColor;
  final String address;
  final String city;
  final String company;
  final String jobTitle;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.gender,
    required this.image,
    required this.age,
    required this.bloodGroup,
    required this.eyeColor,
    required this.address,
    required this.city,
    required this.company,
    required this.jobTitle,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      birthDate: json['birthDate'],
      gender: json['gender'],
      image: json['image'],
      age: json['age'],
      bloodGroup: json['bloodGroup'],
      eyeColor: json['eyeColor'],
      address: json['address']['address'],
      city: json['address']['city'],
      company: json['company']['name'],
      jobTitle: json['company']['title'],
    );
  }
}
