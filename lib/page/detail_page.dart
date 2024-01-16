import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takehomechallenge/getx_controller/favorit_controller.dart';
import 'package:takehomechallenge/model/cartoon_model.dart';

import '../getx_controller/cartoon_controller.dart';

class DetailPage extends StatefulWidget {
  final CartoonModel? cartoonModel;
  const DetailPage({super.key, this.cartoonModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final CartoonController cartoonController = Get.find();
  final FavoriteController favoriteController = Get.find();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                  color: const Color(0xff171b36),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: const Offset(0, 8),
                      blurRadius: 10,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 30),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                              
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        radius: 100,
                        backgroundImage:
                            NetworkImage(widget.cartoonModel!.image.toString()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                        () => IconButton(
                          onPressed: () {
                            favoriteController.insert(
                                idbuku: widget.cartoonModel!.id);
                        
                          },
                          icon: favoriteController.favorite.value
                              ? const Icon(
                                  Icons.favorite,
                                  size: 40,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border_rounded,
                                  size: 40,
                                ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      widget.cartoonModel!.name.toUpperCase().toString(),
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "About Klub ${widget.cartoonModel!.name}",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Species ${widget.cartoonModel!.species}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    maxLines: 4,
                  ),
                  Text(
                    "Gender ${widget.cartoonModel!.gender}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Origin ${widget.cartoonModel!.origin.name}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Location ${widget.cartoonModel!.location.name}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
