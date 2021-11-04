import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';


void main() {
  runApp( MaterialApp(home:HomePage()));
}

class HomePage extends StatefulWidget {



  @override
  _HomePageState createState() => _HomePageState();
  Widget build(BuildContext context){
    return MaterialApp(
      home: Home()
    );
  }
  }

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          //MediaQuery methods in use
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
        )
    );
  }
}

  class _HomePageState extends State<HomePage> {


    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('internet Connectivity'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Check connectivity'),
            onPressed: _checkInternetConnectivity,
          )
        )
      );
    }

    _checkInternetConnectivity() async{
      var result = await Connectivity().checkConnectivity();
      if (result == ConnectivityResult.none){
        _showDialog(
          'No internet',
          "You're not connected to a network"
        );

      } else if (result == ConnectivityResult.mobile){
        _showDialog('Internet Access',"You're connected over mobile data");

      }else if (result == ConnectivityResult.wifi){
        _showDialog('Internet Access', "You're connected over wifi");

      }
    }

    _showDialog (title, text){
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text ('Ok'),
                onPressed: () {
                  Navigator.of(context).pop;
                },
              )
            ],
          );
        }
      );
    }

  }

