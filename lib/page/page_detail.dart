import 'package:flutter/cupertino.dart';
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
  String Status = "bruh";
  // bool? status = ;

  // Future<>void alive(bool? status){
  //   // bool? status;
  //   // status = widget.character?.alive;
  //   if(status=true){
  //     setState(() {
  //       Status = "Alive";
  //       print(Status);
  //     });
  //   }else {
  //     setState(() {
  //       Status = "Deceased";
  //       print(Status);
  //     });
  //   }
  // print(Status);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: (isFavorite) ? Colors.yellow : Colors.white,

      appBar: AppBar(
        title: Text('${widget.character?.name}'),
        centerTitle: true,
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
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
        ),
        // alignment: Alignment.center,
        // height: 220.00,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: (isFavorite)
              ? AssetImage("assets/image/wp2.jpg")
              : AssetImage("assets/image/wp1.jpg"),
          fit: BoxFit.cover,
        )
            // color: (isFavorite) ? Colors.yellow : Colors.white,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                  width: 310,
                  decoration: BoxDecoration(
                      color: (isFavorite)
                          ? Colors.white38.withOpacity(0.5)
                          : Colors.blueAccent.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${widget.character?.name}",
                        style: TextStyle(
                            color:
                                (isFavorite) ? Colors.blueAccent : Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Gender : ${widget.character?.gender}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'House : ${widget.character?.house}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ancestry : ${widget.character?.ancestry}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Species : ${widget.character?.species}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Tanggal Lahir : ${widget.character?.dateOfBirth}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Alive : ${widget.character?.alive}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Patronus : ${widget.character?.patronus}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Actor : ${widget.character?.actor}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      // Container(
      //   padding: EdgeInsets.symmetric(horizontal: 10),
      //   alignment: Alignment.center,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //
      //     ],
      //   ),
      // ),
    );
  }
}
