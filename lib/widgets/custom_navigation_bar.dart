import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: ( int i ) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
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