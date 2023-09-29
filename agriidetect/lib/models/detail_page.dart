import 'dart:io';

import 'package:agriidetect/models/plant_image.dart';
import 'package:agriidetect/models/text_property.dart';
import 'package:flutter/material.dart';


import 'diseaes_model.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({Key? key,required this.diseaselist}) : super(key: key);
  final Datum diseaselist;
  static const routeName = '/suggestions';

  @override
  Widget build(BuildContext context) {
    // Get disease from provider



    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xff00ad59),
        title: const Text('Suggestions'),
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bgr.jpg'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.all((0.02 * size.height)),
            child: Column(
              children: [
                Flexible(
                    child: Center(
                        child: PlantImage(
                          size: size,
                          imageFile: File(''),
                        ))),
                Divider(
                  thickness: (0.0066 * size.height),
                  height: (0.013 * size.height),
                ),
                SizedBox(
                  height: size.height * 0.5,
                  child: ListView(
                    children: [
                      TextProperty(
                        title: 'Disease name',
                        value: diseaselist.name,
                        height: size.height,
                      ),
                      TextProperty(
                        title: 'description',
                        value: diseaselist.description,
                        height: size.height,
                      ),
                      TextProperty(
                        title: 'causal_agent',
                        value:diseaselist.causalAgent,
                        height: size.height,
                      ),
                      TextProperty(
                        title: 'transmission',
                        value:diseaselist.transmission,
                        height: size.height,
                      ),
                      TextProperty(
                        title: 'prevention',
                        value:diseaselist.prevention,
                        height: size.height,
                      ),
                      TextProperty(
                        title: 'symptoms',
                        value:diseaselist.symptoms,
                        height: size.height,
                      ),
                      TextProperty(
                        title: 'diagnosis',
                        value:diseaselist.diagnosis,
                        height: size.height,
                      ),
                      TextProperty(
                        title: 'Solution',
                        value:diseaselist.treatment,
                        height: size.height,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}