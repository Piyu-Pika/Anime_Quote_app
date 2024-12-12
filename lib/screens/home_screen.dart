import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String title = 'Anime Quote App';
  String quote = 'In the spark of an eye, a friend for life; Pikachu, you light up the world with electric might. ⚡';
  String author = 'Piyush Bhardwaj';
  String anime = 'heart of the developer';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title,style: const TextStyle(fontSize: 25,))),
          foregroundColor: const Color.fromARGB(235, 255, 255, 255),
          backgroundColor: const Color.fromARGB(255, 55, 135, 154),
          elevation: 0,
        ),
        body: Container(
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://w0.peakpx.com/wallpaper/438/908/HD-wallpaper-anime-anime-girls-short-hair-simple-dark-hair.jpg"),
              fit: BoxFit.cover,
            ),),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Text(
                        quote,
                        style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "-$author ",
                      style: const TextStyle(fontSize: 18,color: Color.fromARGB(255, 255, 255, 255)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "From:- $anime ",
                      style: const TextStyle(fontSize: 18,color: Color.fromARGB(255, 255, 255, 255)),
                    )
                    ),
              ),
              
              ElevatedButton(
                child: const Text('Get Quote'),
                onPressed: () async {
                  var url = Uri.parse('https://animechan.io/api/v1/quotes/random');
                  var response = await http.get(url);
                  var data = jsonDecode(response.body);
        
                  String quote = data["quote"];
                  String author = data["character"];
                  String anime = data["anime"];
                  setState(() {
                    this.quote = quote;
                    this.author = author;
                    this.anime = anime;
                  });
                },
              ),
            ],),
        )
    )
    );
  }
}
