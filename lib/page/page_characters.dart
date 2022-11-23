import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_mobile/page/page_detail.dart';
import 'package:project_mobile/service/base_network.dart';
import '../model/model_characters.dart';

class PageCharacters extends StatefulWidget {
  const PageCharacters({Key? key}) : super(key: key);

  @override
  _PageCharactersState createState() => _PageCharactersState();
}

class _PageCharactersState extends State<PageCharacters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Characters List"),
      ),
      body: _buildDetailCharactersBody(),
    );
  }

  Widget _buildDetailCharactersBody() {
    return Container(
      child: FutureBuilder(
        future: BaseNetwork.get(''),
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
    return Container(
      padding: EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: data.characters?.length,
            itemBuilder: (BuildContext context, int index) {
              final CharactersData? characters = data.characters?[index];
              return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailCharacters(character: characters)));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          offset: Offset(
                            0.0,
                            10.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: -6.0,
                        ),
                      ],
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.35),
                          BlendMode.multiply,
                        ),
                        image: NetworkImage("${data.characters?[index].image}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 210.0),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.black54),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              "${data.characters?[index].name}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white70),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
    );

    // title: Text("${data.characters?[index].title}"),
  }

  Widget _buildItemCountries(String value) {
    return Text(value);
  }
}
