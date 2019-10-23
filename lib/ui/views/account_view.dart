import 'package:dakgun/core/models/post.dart';
import 'package:dakgun/ui/shared/app_colors.dart';
import 'package:dakgun/ui/shared/text_styles.dart';
import 'package:dakgun/ui/shared/ui_helpers.dart';
import 'package:dakgun/ui/widgets/posts.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  final posts = [
    Post(
      userImg: 'assets/images/user_profile2.png',
      username: 'Rudy Tabuti',
      time: '3 hours ago',
      img: 'assets/images/img_merbabu.png',
      title: 'Merbabu Yukk Gaes!',
      seen: '250 seen',
      vote: '30 vote',
      date: '08 Jan 2019  20:30 PM',
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices iaculis volutpat nulla condimentum. Urna amet\n\nQuis in lacus, vitae nisl. At posuere senectus in tellus. Viverra vitae eu cras nunc nisl et placerat placerat. Nisl nec nam adipiscing pretium. Sed.',
    ),
    Post(
      userImg: 'assets/images/user_profile2.png',
      username: 'Rudy Tabuti',
      time: 'Dec 25 2019',
      img: 'assets/images/img_merbabu2.png',
      title: 'Come on join us!',
      seen: '250 seen',
      vote: '30 vote',
      date: '08 Jan 2019  20:30 PM',
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices iaculis volutpat nulla condimentum. Urna amet\n\nQuis in lacus, vitae nisl. At posuere senectus in tellus. Viverra vitae eu cras nunc nisl et placerat placerat. Nisl nec nam adipiscing pretium. Sed.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: screenSize.height * 0.225,
                  child: Image.asset(
                    'assets/images/user_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RawMaterialButton(
                            child: Icon(
                              Icons.more_horiz,
                              color: dateMeetingTextColor,
                              size: 24.0,
                            ),
                            shape: CircleBorder(
                              side: BorderSide(color: dateMeetingTextColor),
                            ),
                            fillColor: Colors.white,
                            elevation: 0.0,
                            onPressed: () {},
                          ),
                          Container(
                            height: 35.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF43A689), Color(0xFF00FFB4)],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(0.75, 1.0),
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: FlatButton(
                              child: Text(
                                'Message',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                      Text('Rudy Tabuti', style: subheadStyle),
                      UIHelper.verticalSpaceSmall,
                      Text('@jonydhoe', style: subtitleStyle),
                      UIHelper.verticalSpaceSmall,
                      Text(
                        'Risus aliquam et interdum id at tortor.\nIn libero, id sed accumsan, pharetra. Et,\nfacilisis et.',
                        style: descStyle,
                      )
                    ],
                  ),
                ),
                Posts(posts: posts),
              ],
            ),
            Positioned(
              left: 20.0,
              top: screenSize.height * 0.18,
              child: SizedBox(
                height: 72.0,
                width: 72.0,
                child: Image.asset('assets/images/user_profile2.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
