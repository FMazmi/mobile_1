import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_mobile/model/model_news.dart';
import 'package:project_mobile/service/base_network2.dart';

class PageNews extends StatefulWidget {
  const PageNews({Key? key}) : super(key: key);

  @override
  State<PageNews> createState() => _PageNewsState();
}

class _PageNewsState extends State<PageNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game News'),
      ),
      body: Center(
        child: Text('Page News'),
      ),
    );
  }
}

// Widget _buildNewsBody() {
//   return Container(
//     child: FutureBuilder(
//         future: BaseNetwork2.get('news'),
//         builder: (
//           BuildContext context,
//           AsyncSnapshot<dynamic> snapshot,
//         ) {
//           if (snapshot.hasError) {
//             print(snapshot);
//             return _buildErrorSection();
//           }
//         }),
//   );
// }

// Widget _buildErrorSection() {
//   return Text('Error');
// }

// Widget _buildEmptySection() {
//   return Text('Empty');
// }

// Widget _buildLoadingSection() {
//   return Center(
//     child: CircularProgressIndicator(),
//   );
// }

// Widget _buildSuccessSection(NewsDataModel data){
//   return ListView.builder(
//     itemCount: data.news?.length,
//     itemBuilder: (BuildContext context, int index) {
//       final News? news = data.news?[index];
//       return InkWell(
//         onTap: (){},
//         child: Card(
//           child: ListTile(
//             title: Text("${data.news?[index].title}"),
//           ),
//         ),
//       );
//     });
// }
