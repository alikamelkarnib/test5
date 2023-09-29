import 'dart:convert';

import 'package:page_transition/page_transition.dart';
import 'package:agriidetect/models/plant_widget.dart';
import 'package:agriidetect/ui/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:readmore/readmore.dart';
import '../controllers/diseases_controller.dart';

import '../models/detail_page.dart';
import '../models/diseaes_model.dart';
import '../models/plants.dart';
import '../utils/constants.dart';
import 'package:faker/faker.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<Disease> diseaselist ;
  DiseasesController diseasesController=new DiseasesController();
  TextEditingController editingController = TextEditingController();
  List<Datum> _users = <Datum>[];
  List<Datum> _usersDisplay = <Datum>[];

  bool _isLoading = true;

    @override
    void initState() {
      super.initState();
      diseasesController.getdisease().then((value) {
        setState(() {
          _isLoading = false;
          _users.addAll(value.data);
          _usersDisplay = _users;

        });
      });
    }

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(18,58,57,1),
          actions: [
        TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(SignIn());
            },
            child: Icon(
              Icons.logout,
              color: Colors.cyanAccent,
            ))
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        Expanded(
                            child:TextField(


                              onChanged: (searchText) {
                                searchText = searchText.toLowerCase();
                                setState(() {
                                  _usersDisplay = _users.where((u) {
                                    var fName = u.name.toLowerCase();

                                    return fName.contains(searchText) ;
                                  }).toList();
                                });
                              },

                              decoration: InputDecoration(
                                hintText: 'Search Plant',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            )),

                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),






            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height/1.5,

            child: ListView.builder(
                        itemCount: _usersDisplay.length + 1,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
      if (!_isLoading) {
      return index == 0 ? _searchBar() : PlantWidget(diseaselist: this._usersDisplay[index - 1]);
      } else {
        return   Align(
          alignment: Alignment.topCenter,
          child: CircularProgressIndicator(),
        );
      }
      },





                    )





            ),














          ],
        ),
      )
    );
  }
  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child:Container(
        padding: const EdgeInsets.only(left: 16, bottom: 20, top: 10),
        child: const Text(
          'New Plants',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
