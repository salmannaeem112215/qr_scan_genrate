import 'dart:convert';

class QrData {
  final String name;
  final String address;
  final String pin;

  static const String name_ = 'name';
  static const String address_ = 'address';
  static const String pin_ = 'pin';

  QrData({
    required this.name,
    required this.address,
    required this.pin,
  });

  factory QrData.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return QrData(
      name: json[name_] == null ? 'IN_VALID' : json[name_]!,
      address: json[address_] == null ? 'IN_VALID' : json[address_]!,
      pin: json[pin_] == null ? 'IN_VALID' : json[pin_]!,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      name_: name,
      address_: address,
      pin_: pin,
    };
  }
}
