import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../getx_controller/favorit_controller.dart';
import '../widget/list_widget.dart';
import 'detail_page.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({super.key});

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  final FavoriteController favoriteController = Get.find();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    favoriteController.allData();
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Favorite Items',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xff171b36),
      ),
      body: GetBuilder<FavoriteController>(
        init: FavoriteController(),
        builder: (controller) {
          return controller.favoriteBooks.isEmpty
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
                    itemCount: controller.favoriteBooks.length,
                    itemBuilder: (BuildContext context, index) {
                      var data = controller.favoriteBooks[index];

                      return ListBookWidget(
                        title: data.name,
                        species: data.species,
                        location: data.gender,
                        function: () {
                          Get.to(
                            DetailPage(
                              cartoonModel: data,
                            ),
                          );
                          favoriteController.cekFavorit(idfav: data.id);
                        },
                        contWidget: InkWell(
                          onTap: () {
                            Alert(
                              context: context,
                              type: AlertType.warning,
                              title: "Delete Your Favorite",
                              desc: "Are you sure delete Your Favorite?",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "CENCEL",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  color: const Color.fromRGBO(0, 179, 134, 1.0),
                                ),
                                DialogButton(
                                  child: Text(
                                    "DELETE",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () async {
                                    await controller.delete(idParams: data.id);
                                    Get.back();
                                  },
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(116, 116, 191, 1.0),
                                    Color.fromRGBO(52, 138, 199, 1.0)
                                  ]),
                                )
                              ],
                            ).show();
                          },
                          child: Container(
                            width: size.width / 10,
                            height: size.height / 26,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
