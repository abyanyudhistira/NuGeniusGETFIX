import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/discuss_controller.dart';

class DiscussView extends GetView<DiscussController> {
  const DiscussView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiscussView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DiscussView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
