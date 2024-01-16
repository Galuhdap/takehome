import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/cartoon_model.dart';

class CartoonController extends GetxController {
  List<CartoonModel> items = [];
  Rx<String> searchQuery = ''.obs;

  RxList<CartoonModel> searchResults = <CartoonModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchData() async {
    try {
      final response =
          await Dio().get("https://rickandmortyapi.com/api/character");
      items = (response.data['results'] as List<dynamic>)
          .map((item) => CartoonModel.fromJson(item as Map<String, dynamic>))
          .toList();

      update();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> search(String query) async {
    searchQuery.value = query;
    debounce(searchQuery, (String value) async {
      try {
        final response = await Dio().get(
          'https://rickandmortyapi.com/api/character/',
          queryParameters: {'name': value},
        );

        searchResults.value = (response.data['results'] as List<dynamic>)
            .map((item) => CartoonModel.fromJson(item as Map<String, dynamic>))
            .toList();

        update();
      } catch (e) {
        rethrow;
      }
    }, time: const Duration(milliseconds: 800));
  }
}
