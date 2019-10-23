import 'package:dakgun/core/models/message.dart';
import 'package:dakgun/ui/shared/text_styles.dart';
import 'package:dakgun/ui/shared/ui_helpers.dart';
import 'package:dakgun/ui/widgets/page_header.dart';
import 'package:flutter/material.dart';

class InboxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PageHeader(
              title: 'Inbox',
              subtitle: 'Informasi pesan buat kamu',
              action: IconButton(
                icon: Image.asset('assets/images/search.png'),
                onPressed: () {
                  print(MediaQuery.of(context).size.aspectRatio);
                },
              ),
            ),
            _Messages(),
          ],
        ),
      ),
    );
  }
}

class _Messages extends StatelessWidget {
  final messages = [
    Message(
        isOnline: true,
        isRead: false,
        userImg: 'assets/images/user_profile2.png',
        username: 'Rudy Tabuti'),
    Message(
        isOnline: true,
        isRead: true,
        userImg: 'assets/images/user_profile3.png',
        username: 'Carolina Tan'),
    Message(
        isOnline: false,
        isRead: true,
        userImg: 'assets/images/user_profile4.png',
        username: 'Jenny Cole'),
    Message(
        isOnline: true,
        isRead: true,
        userImg: 'assets/images/user_profile5.png',
        username: 'Willy Wonka'),
    Message(
        isOnline: true,
        isRead: true,
        userImg: 'assets/images/user_profile6.png',
        username: 'Mischa Dominic'),
    Message(
        isOnline: false,
        isRead: true,
        userImg: 'assets/images/user_profile7.png',
        username: 'Warrent Harvey'),
    Message(
        isOnline: true,
        isRead: true,
        userImg: 'assets/images/user_profile8.png',
        username: 'Larry Nove'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        var message = messages[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: message.isRead == true ? Colors.white : Color(0xFF43A689),
              height: screenSize.aspectRatio > 0.6
                  ? screenSize.height * 0.15
                  : screenSize.height * 0.125,
              width: 4.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                height: screenSize.aspectRatio > 0.6
                    ? screenSize.height * 0.15
                    : screenSize.height * 0.125,
                color:
                    message.isRead == true ? Colors.white : Color(0xFFEBF4F1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            SizedBox(
                              height: 40.0,
                              width: 40.0,
                              child: Image.asset(
                                message.userImg,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            message.isOnline == true
                                ? Positioned(
                                    right: 0.0,
                                    bottom: 0.0,
                                    child: Container(
                                      height: 10.0,
                                      width: 10.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF39EE81),
                                        border: Border.all(color: Colors.white),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        UIHelper.horizontalSpaceMedium,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(message.username, style: userStyle),
                            UIHelper.verticalSpaceSmall,
                            Text(
                              'Consequat tellus mattis sit\nultricies sed sit...',
                              style: TextStyle(
                                color: Color.fromRGBO(50, 50, 93, 0.8),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          height: 6.0,
                          width: 6.0,
                          decoration: BoxDecoration(
                            color: message.isRead == true
                                ? Colors.transparent
                                : Color(0xFF2D81FF),
                            shape: BoxShape.circle,
                          ),
                        ),
                        UIHelper.horizontalSpaceSmall,
                        Text('3 h', style: subtitleStyle)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
