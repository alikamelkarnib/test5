
import 'package:agriidetect/models/plants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/diseases_controller.dart';
import '../controllers/login_controller.dart';
import '../utils/constants.dart';
import 'detail_page.dart';

import 'diseaes_model.dart';

class PlantWidget extends StatefulWidget {

  const PlantWidget({
    Key? key,  required this.diseaselist,
  }) : super(key: key);

 final Datum diseaselist;



  @override
  State<PlantWidget> createState() => _PlantWidgetState();
}

class _PlantWidgetState extends State<PlantWidget> {
  DiseasesController diseasesController = Get.put(DiseasesController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;






   return GestureDetector(
    onTap: ()async {


     Navigator.push(
            context,
            PageTransition(
                child:Suggestions(
                 diseaselist: widget.diseaselist,

                ),
                type: PageTransitionType.bottomToTop));
    },
    child: Container(
    decoration: BoxDecoration(
    color: Constants.primaryColor.withOpacity(.1),
    borderRadius: BorderRadius.circular(10),
    ),
    height: 150.0,
    padding: const EdgeInsets.only(left: 10, top: 10),
    margin: const EdgeInsets.only(bottom: 10, top: 10),
    width: size.width,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Stack(
    clipBehavior: Clip.none,
    children: [
    Container(
    width: 60.0,
    height: 60.0,
    decoration: BoxDecoration(
    color: Constants.primaryColor.withOpacity(.8),
    shape: BoxShape.circle,
    ),
    ),
    Positioned(
    bottom: -5,
    left: 0,
    right: 0,
    child: SizedBox(
    height: 100.0,
    child:
    Image.asset(''),
    ),
    ),
    Positioned(

top:1,
    left:80,
     child: SizedBox(
         height: 200.0,
      width: 250.0,

    child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    Text(  "Name: " + widget.diseaselist.name,
      style: TextStyle(


        fontSize: 20,
        color: Constants.blackColor,
      ),),
SizedBox(height: 2,),

     ReadMoreText(
         "Description: " + widget.diseaselist.description,
      trimLines: 2,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,

      trimExpandedText: 'Show less',
         style: TextStyle(

          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Constants.blackColor,
         ),

        ),






    ],
    )),
    ),
    ],
    ),

    ],
    ),
    ),





    );






  }
}