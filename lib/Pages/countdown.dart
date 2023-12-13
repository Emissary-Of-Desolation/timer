import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class CountDown extends StatefulWidget {
  const CountDown({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 38, 38, 40),
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.keyboard_arrow_left_rounded,
                color: Colors.white, size: 28),
            onPressed: null,
          ),
          backgroundColor: const Color.fromARGB(255, 38, 38, 40),
          centerTitle: true,
          title: const Text(
            'Mindful Meal Timer',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularCountDownTimer(
                    duration: 30,
                    fillColor: Colors.green,
                    ringColor: Colors.white,
                    controller: _controller,
                    width: 200,
                    height: 200,
                    strokeWidth: 10,
                    strokeCap: StrokeCap.round,
                    textStyle: const TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    isReverse: true,
                    isReverseAnimation: true,
                    isTimerTextShown: true,
                    autoStart: true,
                    textFormat: CountdownTextFormat.MM_SS,
                  ),
                  const Positioned(
                    bottom: 60.0,
                    child: Text(
                      'Minutes Remaining',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 20),
                  Switch(
                    value: true,
                    onChanged: (value) {
                      setState(() {
                        value = true;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                  const Text(
                    'Sound On',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _controller.pause();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 176, 222, 178),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(color: Colors.white),
                      ),
                      minimumSize: const Size(285, 65),
                    ),
                    child: const Text(
                      'Pause',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _controller.reset();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 38, 38, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(color: Colors.white),
                      ),
                      minimumSize: const Size(285, 65),
                    ),
                    child: const Text(
                      "Let's Stop, I'm Full Now",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
