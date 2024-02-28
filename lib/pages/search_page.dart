import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {

  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: Text('Search a City',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orangeAccent,
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data){
              cityName = data;
            },
            decoration: InputDecoration(
              label: Text('search'),
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 42),
              suffixIcon:  Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Enter a City',
            ),
          ),
        ),
      ),
    );
  }
}
