
import 'package:agriidetect/ui/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/camera.dart';
import '../signup_page.dart';
class BottomNavBarState extends StatefulWidget {
  const BottomNavBarState({Key? key}) : super(key: key);

  @override
  State<BottomNavBarState> createState() => _BottomNavBarStateState();
}

class _BottomNavBarStateState extends State<BottomNavBarState> {
  int _selectedIndex = 0;
  final List<Widget> tabs = [
   HomeScreen(),


    Center(child: Text('Image')),
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

              Icon(Icons.add_circle_outline,size:0,color: Colors.white,),


              Icon(Icons.account_box_outlined,size:30,color: Colors.white,),
            ]
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        backgroundColor: Color.fromRGBO(18,58,57,1) ,
        onOpen: () => setState(() {  _selectedIndex = 1; }),
        spacing: 10,
        children: [
          SpeedDialChild(
            child: const FaIcon(
              FontAwesomeIcons.file,
              color: Colors.white,
            ),
            label: "Choose image",
            backgroundColor: Colors.green,
            onTap: () async {
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return SignUp();
              }),);
            },
          ),
          SpeedDialChild(
            child: const FaIcon(
              FontAwesomeIcons.camera,
              color: Colors.green,
            ),
            label: "Take photo",
            backgroundColor:Colors.white,
            onTap: () async {
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return SignUp();
              }),);
            },
          ),
        ],
      ),
    );
  }
}
