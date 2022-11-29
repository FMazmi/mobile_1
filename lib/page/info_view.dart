import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../service/const.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Anggota'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: CarouselSlider.builder(
          options: CarouselOptions(
            // enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            // pauseAutoPlayOnTouch: true,
            height: 550,
            viewportFraction: 0.6,
            enlargeCenterPage: true,
          ),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final Data data = dataList[index];
            return Stack(
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [
                //       Color.fromARGB(255, 0, 0, 0),
                //       Color.fromARGB(255, 60, 55, 92),
                //       Color.fromARGB(255, 87, 84, 178),
                //       Color.fromARGB(255, 76, 57, 245),
                //     ],
                //   )),
                // ),
                Column(
                  children: [
                    SizedBox(
                      height: 110,
                    ),
                    Container(
                      height: 260,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(50.0),
                          image: DecorationImage(
                              image: AssetImage('${data.img}'),
                              fit: BoxFit.cover),
                          color: Colors.black),
                      // child: Text('${data.Nama}')
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        '${data.nim}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      color: Colors.yellow,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        '${data.nama}',
                        style: TextStyle(fontSize: 12, color: Colors.yellow),
                      ),
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }
}
