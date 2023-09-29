

import 'package:agriidetect/admin/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BottomNavBarStateadmin extends StatefulWidget {
  const BottomNavBarStateadmin({Key? key}) : super(key: key);

  @override
  State<BottomNavBarStateadmin> createState() => _BottomNavBarStateadminState();
}

class _BottomNavBarStateadminState extends State<BottomNavBarStateadmin> {
  int _selectedIndex = 0;
  final List<Widget> tabs = [
   HomeScreen(),

    Center(child: Text('stores Screen')),
    Center(child: Text('cart Screen')),
    Center(child: Text('profile Screen')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            index: _selectedIndex,
            onTap: (index){
              setState(() {
                _selectedIndex = index;
              });

            },
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            color: Color.fromRGBO(18,58,57,1),
            items:<Widget> [
              Icon(Icons.home,size:30,color: Colors.white,),

              Icon(Icons.camera_alt,size:30,color: Colors.white,),

              Icon(
                CupertinoIcons.group_solid
                ,size:30,color: Colors.white,),
              Icon(Icons.account_box_outlined,size:30,color: Colors.white,),
            ]
        ),
    );
  }
}
