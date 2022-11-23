import 'package:flutter/material.dart';
import '../model/model_characters.dart';
import 'page_characters.dart';
import '../service/base_network.dart';

class DetailCharacters extends StatefulWidget {
  final CharactersData? character;
  const DetailCharacters({Key? key, required this.character}) : super(key: key);

  @override
  State<DetailCharacters> createState() => _DetailCharactersState();
}

class _DetailCharactersState extends State<DetailCharacters> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: (isFavorite) ? Colors.green.withOpacity(0.7) : Colors.white,
        appBar: AppBar(
          title: Text('${widget.character?.name}'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: (isFavorite)
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.0,),
              height: 220.00,
              decoration: BoxDecoration(
                color: (isFavorite) ? Colors.yellow : Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  "${widget.character?.image}",
                  width: 150,
                  // height: MediaQuery.of(context).size.height,
                  // height: 210,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "${widget.character?.name}",
                    style: TextStyle(
                        color: (isFavorite)
                            ? Colors.yellow
                            : Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.character?.gender}',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'Tanggal Lahir : ${widget.character?.dateOfBirth}',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'About Game',
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      '${widget.character?.alive}',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
