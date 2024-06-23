class TourisModel {
  final String name;
  final String phoneNumber;
  final String whatsAppNumber;
  final String email;
  final String date;
  final String selectedCountryCode;// Add this line

  TourisModel({
    required this.name,
    required this.phoneNumber,
    required this.whatsAppNumber,
    required this.email,
    required this.date,
    required this.selectedCountryCode,// Add this line
  });

  factory TourisModel.fromJson(Map<String, dynamic> json) {
    return TourisModel(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      whatsAppNumber: json['whatsAppNumber'],
      email: json['email'],
      date: json['date'],
      selectedCountryCode: json['selectedCountryCode'], // Add this line
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'whatsAppNumber': whatsAppNumber,
      'email': email,
      'date': date,
      'selectedCountryCode' :selectedCountryCode,
    };
  }
}
