import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      elevation: 0,
      items: const<BottomNavigationBarItem>[
        
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Mapa'
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.double_arrow_rounded),
          label: 'Direcciones'
        ),


      ]
      );
  }
}