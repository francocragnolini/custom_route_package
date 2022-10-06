import 'package:flutter/material.dart';
import 'package:custom_route_transition_practice/custom_route_transition_practice.dart';
//import 'package:custom_transition_route/helpers/route_transitions.dart';
import 'package:custom_transition_route/pages/page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
          child: Text("Go to Page 2"),
          color: Colors.white,
          onPressed: () {
            RouteTransitions(
              context: context,
              child: Page2(),
              animation: AnimationType.fadeIn,
              duration: Duration(seconds: 2),
              replacement: true,
            );
          },
        ),
      ),
    );
  }
}
