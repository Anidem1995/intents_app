import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:android_intent/android_intent.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intents'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Telefono', style: TextStyle(color: Colors.white),),
                color: Colors.red,
                onPressed: () => _launchURL('tel:4612366032'),
              ),
              RaisedButton(
                child: Text('SMS', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: () => _launchURL('sms:'),
              ),
              RaisedButton(
                child: Text('Email', style: TextStyle(color: Colors.white),),
                color: Colors.orange,
                onPressed: () => _launchURL('mailto:14030732@itcelaya.edu.mx?subject=Intent=Prueba')
              ),
              RaisedButton(
                child: Text('Web', style: TextStyle(color: Colors.white),),
                color: Colors.yellow,
                onPressed: () => _launchURL('http://google.com')
              ),
              RaisedButton(
                child: Text('Contactos', style: TextStyle(color: Colors.white),),
                color: Colors.black,
                onPressed: () => _launchURL('content://contacts/people')
              ),
              RaisedButton(
                child: Text('Maps', style: TextStyle(color: Colors.white),),
                color: Colors.grey,
                onPressed: () => _launchURL('geo:')
              )
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(String uri) async {
    if(await canLaunch(uri))
      await launch(uri);
    else
      throw 'No se pudo abrir $uri';
  }

}
