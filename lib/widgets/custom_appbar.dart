import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function()? onPressed;

  const CustomAppBar({
    Key? key,
    this.onPressed,
  })  : preferredSize = const Size.fromHeight(70),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  final constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu),
        color: Colors.black,
      ),
      title: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: constantColors.defaultColors['searchBarColor'],
                filled: true,
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                labelText: 'Enter something',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 40,
            height: 40,
            color: constantColors.defaultColors['searchBarColor'],
            child: const Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
