import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {

  final Function(String)? onChange;

  const SearchWidget({
    super.key,
    required this.onChange,
  });


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
          top: 10, bottom: 10, left: 25, right: 25),
      child: SizedBox(
        width: size.width * 0.9,
        height: 40,
        child: TextField(
          onChanged: onChange,
          enabled: true,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Colors.grey.withOpacity(0.6))),
            contentPadding:
                const EdgeInsets.only(top: 20, left: 10, right: 10),
          ),
          style: const TextStyle(fontSize: 15),
          cursorColor: Colors.black,
        ),
      ),
    );
  }
}
