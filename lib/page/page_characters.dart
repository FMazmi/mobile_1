// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_mobile/page/page_detail.dart';
import 'package:project_mobile/service/base_network.dart';
import 'package:project_mobile/service/data_source.dart';
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
    return Container(
      padding: EdgeInsets.all(10.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 20,
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
                child: Stack(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(top: 210.0),
                    // ),
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${data.characters?[index].image}"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[Colors.black12, Colors.black45],
                        ),
                      ),
                      child: Text(
                        '${data.characters?[index].name}',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ],
                ));
          }),
    );

    // title: Text("${data.characters?[index].title}"),
  }

  Widget _buildItemCountries(String value) {
    return Text(value);
  }
}
