import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import './qr_data.dart';

class QrController extends GetxController {
  final name = TextEditingController();
  final address = TextEditingController();
  final pincode = TextEditingController();

  final qrValue = ''.obs;
  final scannedQrCode = ''.obs;

  void setQrCodeValue(String val) {
    qrValue.value = val;
  }

  void valueChanges() {
    final qr =
        QrData(name: name.text, address: address.text, pin: pincode.text);
    qrValue.value = json.encode(qr.toJson());
    print(qr.toJson());
  }

  Future<void> scanQr() async {
    try {
      scannedQrCode.value = await FlutterBarcodeScanner.scanBarcode(
        '#666666',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (scannedQrCode.value == '-1') {
        Get.snackbar('QR Scanner ', 'Scanning Process Canceled');
      } else {
        extractValues(scannedQrCode.value);
        valueChanges();
      }
      print('Thes Values areeeee :${scannedQrCode.value}');
    } on PlatformException {}
  }

  void extractValues(String inputString) {
    print('INPUT STRING $inputString');
    final qr = QrData.fromJson(inputString);
    name.text = qr.name;
    address.text = qr.address;
    pincode.text = qr.pin;
  }

// Example usage
  final inputString =
      'Address: "HC:00:00:00:00"\nName: "John Doe"\nPIN Code: "123456"';
}
