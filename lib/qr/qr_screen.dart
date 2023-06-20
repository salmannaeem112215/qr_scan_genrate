import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'qr_controller.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QrController qrController = Get.put(QrController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => QrImageView(
                      data: qrController.qrValue.value,
                      size: 200,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: qrController.name,
                    decoration: kInputDecoration('Name'),
                    onChanged: (val) => qrController.valueChanges(),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: qrController.address,
                    decoration: kInputDecoration('Address'),
                    onChanged: (val) => qrController.valueChanges(),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    // validator: (value) => ,
                    keyboardType: TextInputType.phone,
                    controller: qrController.pincode,
                    decoration: kInputDecoration('PIN Code'),
                    onChanged: (val) => qrController.valueChanges(),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    // validator: (value) => ,
                    keyboardType: TextInputType.number,
                    controller: qrController.height,
                    decoration: kInputDecoration('Height'),
                    onChanged: (val) => qrController.valueChanges(),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    // validator: (value) => ,
                    keyboardType: TextInputType.number,
                    controller: qrController.width,
                    decoration: kInputDecoration('Width'),
                    onChanged: (val) => qrController.valueChanges(),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.all(16),
                      ),
                      onPressed: () {
                        qrController.scanQr();
                      },
                      child: const Text(
                        'Scan Devices',
                        style: TextStyle(fontSize: 18),
                      )),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

kInputDecoration(String lable) => InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      labelText: lable,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: const TextStyle(fontSize: 18),
    );
