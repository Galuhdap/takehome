import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takehomechallenge/widget/search_widget.dart';

import '../getx_controller/cartoon_controller.dart';
import '../getx_controller/favorit_controller.dart';
import '../widget/list_widget.dart';
import 'detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FavoriteController favoriteController = Get.find();
  final CartoonController cartoonController = Get.find();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Search',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xff171b36),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(
              onChange: (value) {
                cartoonController.searchQuery.value = value;
                cartoonController.search(value);
              },
            ),
            Obx(
              () => cartoonController.searchQuery.isEmpty
                  ? const Center(
                      child: Text('Lakukan Search'),
                    )
                  : cartoonController.searchResults.isEmpty
                      ? const Center(
                          child: Text('Tidak ada hasil yang ditemukan'),
                        )
                      : SizedBox(
                          height: size.height * 0.7,
                          child: ListView.builder(
                            padding: const EdgeInsets.only(
                              top: 15,
                              left: 25,
                              right: 25,
                            ),
                            itemCount: cartoonController.searchResults.length,
                            itemBuilder: (BuildContext context, index) {
                              var data = cartoonController.searchResults[index];
                              return ListBookWidget(
                                title: data.name,
                                species: data.species,
                                location: data.location.name,
                                function: () {
                                  Get.to(
                                    DetailPage(
                                      cartoonModel: data,
                                    ),
                                  );
                                  favoriteController.cekFavorit(
                                      idfav: data.id);
                                },
                              );
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
