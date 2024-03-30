import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkErrorDialog extends StatelessWidget {
  const NetworkErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('No Internet'.tr),
      content: Text('Kindly check your internet connection'.tr),
    );
  }
}
