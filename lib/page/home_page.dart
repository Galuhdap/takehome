import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takehomechallenge/getx_controller/cartoon_controller.dart';
import 'package:takehomechallenge/page/detail_page.dart';

import '../getx_controller/favorit_controller.dart';
import '../widget/list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CartoonController cartoonController = Get.find();
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Home',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xff171b36),
      ),
      body: GetBuilder<CartoonController>(
        builder: (controller) {
          return controller.items.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  height: size.height * 0.8,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 25,
                      right: 25,
                    ),
                    itemCount: controller.items.length,
                    itemBuilder: (BuildContext context, index) {
                      var data = controller.items[index];
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
                          favoriteController.cekFavorit(idfav: data.id);
                        },
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
