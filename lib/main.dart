import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountdownScreen(),
    );
  }
}

class CountdownScreen extends StatefulWidget {
  @override
  _CountdownScreenState createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen> {
  int _countdown = 15;
  int _randomNumber = 0;
  Timer? _timer;

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer!.cancel();
          Random rand = Random();
          _randomNumber = 70 + rand.nextInt(80 - 70 + 1);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Timer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _countdown!=0?
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Turn on Flash Light and keep your finger on the camera'),
                ),
                Text(
                  '$_countdown ',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ):
            //SizedBox(height: 20),
            //if (_countdown == 0)
              Text(
                'Your Heart Rate is: $_randomNumber',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_countdown!=0) {
            startCountdown();
          }else{
            setState(() {
              _countdown=15;
              startCountdown();
            });

          }
        },
        child: Icon(Icons.timer),
      ),
    );
  }
}
