import 'package:flutter/material.dart';
import 'package:project_mobile/page/characters_view.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2 - 150,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    'assets/image/background1.jpg',
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.6),
                    colorBlendMode: BlendMode.dstATop,
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'HARRY POTTER CHARACTERS',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Get hooked on a hearty helping of heroes and villains\nfrom the humble House of Ideas!',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                CharactersView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
