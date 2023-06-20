import 'dart:convert';

class QrData {
  final String name;
  final String address;
  final String pin;
  final int height;
  final int width;

  static const String name_ = 'name';
  static const String address_ = 'address';
  static const String pin_ = 'pin';
  static const String height_ = 'height';
  static const String width_ = 'width';

  QrData({
    required this.name,
    required this.address,
    required this.pin,
    required this.height,
    required this.width,
  });

  factory QrData.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);

    return QrData(
      name: json[name_] == null ? 'IN_VALID' : json[name_]!,
      address: json[address_] == null ? 'IN_VALID' : json[address_]!,
      pin: json[pin_] == null ? 'IN_VALID' : json[pin_]!,
      width: json[width_] == null
          ? 0
          : json[width_].runtimeType == int
              ? json[width_]!
              : int.tryParse(json[width_]!) ?? 0,
      height: json[height_] == null
          ? 0
          : json[width_].runtimeType == int
              ? json[width_]!
              : int.tryParse(json[height_]!) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      name_: name,
      address_: address,
      pin_: pin,
      width_: width,
      height_: height,
    };
  }
}
