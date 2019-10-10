import 'package:dakgun/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: backgroundColor,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Discover',
                        style: TextStyle(fontSize: 32.0),
                      ),
                      Image.asset('assets/images/notification_bell.png')
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
