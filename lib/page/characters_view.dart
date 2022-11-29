// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_mobile/page/page_detail.dart';
import 'package:project_mobile/service/base_network.dart';
import 'package:project_mobile/service/data_source.dart';
import '../model/model_characters.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({Key? key}) : super(key: key);

  @override
  _CharactersViewState createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildDetailCharactersBody(),
    );
  }

  Widget _buildDetailCharactersBody() {
    return Container(
      child: FutureBuilder(
        future: CharactersSource.instance.loadCharacters(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            print(snapshot);
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            CharactersDataModel charactersModel =
                CharactersDataModel.fromJson(snapshot.data);
            print(charactersModel);
            return _buildSuccessSection(charactersModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(CharactersDataModel data) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 60, 55, 92),
              Color.fromARGB(255, 87, 84, 178),
              Color.fromARGB(255, 76, 57, 245),
            ],
          )),
        ),
        Center(
          child: CarouselSlider.builder(
            options: CarouselOptions(
              enableInfiniteScroll: true,
              // autoPlay: true,
              // autoPlayInterval: Duration(seconds: 5),
              // autoPlayAnimationDuration: Duration(milliseconds: 800),
              // pauseAutoPlayOnTouch: true,
              height: 340,
              viewportFraction: 0.6,
              enlargeCenterPage: true,
            ),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final CharactersData? characters = data.characters?[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailCharacters(character: characters)));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(40),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 8,
                          child: Container(
                            child: Hero(
                              tag: "${data.characters?[index].image}",
                              child: Image.network(
                                "${data.characters?[index].image}",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 5,
                          width: 80,
                          color: Colors.amber,
                        ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${data.characters?[index].name}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "${data.characters?[index].actor}",
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
    // title: Text("${data.characters?[index].title}"),
  }
}
