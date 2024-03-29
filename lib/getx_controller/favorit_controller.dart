import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../model/cartoon_model.dart';
import '../sqlite/db.dart';

class FavoriteController extends GetxController {
  var numItems = 0.obs;
  RxBool favorite = false.obs;
  List<CartoonModel> favoriteBooks = [];
  RxList<CartoonModel> favList = <CartoonModel>[].obs;

  @override
  void onInit() {
    allData();
    super.onInit();
  }

  Future insert({required int idfav}) async {
    final Database database = await DatabaseService().database();
    final favorites = await database
        .rawQuery('SELECT * FROM fav WHERE id_fav = ?', [idfav]);
    if (favorites.isEmpty) {
      favorite.toggle();
      await database.insert('fav', {'id_fav': idfav});
      await allData();
    } else {
      Get.snackbar(
        "Already",
        "You Already Liked in Favorit",
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
    }
    update();
  }

  Future<void> allData() async {
    final Database database = await DatabaseService().database();
    final data = await database.query('fav');

    final response =
        await Dio().get("https://rickandmortyapi.com/api/character");

    favoriteBooks = (response.data['results'] as List<dynamic>)
        .where((item) =>
            data.map((dataItem) => dataItem['id_fav']).contains(item['id']))
        .map((item) => CartoonModel.fromJson({...item, 'favorite': true}))
        .toList();
    update();
  }

  Future delete({required int idParams}) async {
    final Database database = await DatabaseService().database();
    await database.delete('fav', where: 'id_fav = ?', whereArgs: [idParams]);
    await allData();
    update();
  }

  void cekFavorit({required int idfav}) async {
    final Database database = await DatabaseService().database();
    final favorites = await database
        .rawQuery('SELECT * FROM fav WHERE id_fav = ?', [idfav]);
    favorite.value = favorites.isNotEmpty;
    update();
  }
}
