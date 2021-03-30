import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {

    // simulate network request for a username
    var username = await Future.delayed(Duration(seconds: 3), () {
      return 'yoshi';
    });

    // simulate network request to get the bio of the username
    var bio = await Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
      return 'vegan, musician & egg collector  ';
    });

    print('$username - $bio');

  }

  int counter = 0;

  @override
  void initState() {
    super.initState();
    getData();
    print('hey there!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }

}
