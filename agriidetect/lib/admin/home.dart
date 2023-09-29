import 'dart:convert';

import 'package:agriidetect/ui/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


    final TextEditingController _textController = TextEditingController();
    String _generatedImageUrl = '';

    Future<void> generateImage() async {
      final String apiKey = '12aa703f-be7d-4bff-9acf-882b600362f8'; // Replace with your OpenAI API key
      final String prompt = _textController.text.toString();
try{
      // Make a POST request to OpenAI API to generate image
      var response = await http.post(
        Uri.parse('https://api.deepai.org/api/text2img' ),
        body: jsonEncode({
          'text': prompt,


        },


        ),
        headers:{   'Content-Type': 'application/json',
          'api-key': '12aa703f-be7d-4bff-9acf-882b600362f8',},
      );
print(response.statusCode);
      if (response.statusCode == 200) {
        // Parse the API response and update the generated image URL
        final responseData = jsonDecode(response.body);
        setState(() {
          _generatedImageUrl = responseData['data'][0]['url'];
        });
      } else {        // Handle API error
        print('Error generating image: ${response.reasonPhrase}');
      }}catch(e){print(e.toString());}
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Image Generation App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text input field for entering the prompt
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Enter text prompt',
                ),
              ),
              SizedBox(height: 16),
              // Button to trigger image generation
              ElevatedButton(
                onPressed: generateImage,
                child: Text('Generate Image'),
              ),
              SizedBox(height: 16),
              // Display the generated image if available
              if (_generatedImageUrl.isNotEmpty)
                Image.network(_generatedImageUrl),
            ],
          ),
        ),
      );
    }
}
