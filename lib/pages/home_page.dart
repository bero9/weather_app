import 'package:flutter/material.dart';
import 'package:weather_app/pages/search_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(color: Colors.white,icon: Icon(Icons.search), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SearchPage();
            }));
          },),
        )],
        backgroundColor: Colors.blue,
        title: const Text('Weather App',style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
