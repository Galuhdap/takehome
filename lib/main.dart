import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takehomechallenge/getx_controller/binding/binding_controller.dart';

import 'routes/app_pages.dart';

void main() async {
  runApp(
    GetMaterialApp(
      initialBinding: BindingController(),
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
