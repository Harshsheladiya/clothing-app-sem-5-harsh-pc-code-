import 'package:flutter/material.dart';
import 'package:parichay_card/customShape.dart';
import 'package:parichay_card/login_body.dart';
import 'contact.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 350,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Center(child: RichText(text:TextSpan(text: 'welcome,\n',
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20, color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                text: 'E-comm',style: TextStyle(fontSize: 30,color: Colors.white)
              )
            ]),)
            ),

          ),

        ),
      ),
      body: Center(
        child: LoginPage(

        ),
      ),
    );
  }
}
