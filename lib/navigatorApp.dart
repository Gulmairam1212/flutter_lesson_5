import 'package:flutter/material.dart';

class NavigatorApp extends StatelessWidget{
  final String productName;

  const NavigatorApp({Key? key, required this.productName}):super(key:key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   home: FirstPage(),

    );
  }

}
class FirstPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar( title: Text(' FirstPage'),
    
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
        child: Text('Перейти на второй экран')
      ),
    ),
    );
  }

}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar( title: Text(' SecondPage'),
    
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => ThirdPage()),
          );
        },
        child: Text('Перейти на третий экран')
      ),
    ),
    );
  }
}

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar( title: Text('ThirdPage'),
    
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.popUntil(context, (rout) => rout.isFirst);
        },
        child: Text('Вернутся на первый экран')
      ),
    ),
    );
  }
}


