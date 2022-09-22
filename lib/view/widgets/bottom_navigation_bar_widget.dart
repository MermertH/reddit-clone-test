import 'package:flutter/material.dart';
import 'package:reddit_clone_test/constants/colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final constantColors = ConstantColors();
    return BottomNavigationBar(
      fixedColor: constantColors.defaultColors['primaryColor'],
      unselectedItemColor: constantColors.defaultColors['black'],
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.explore),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.add),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.sms),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.notifications),
        )
      ],
    );
  }
}
