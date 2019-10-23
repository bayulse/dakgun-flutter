import 'package:dakgun/core/constants/app_constants.dart';
import 'package:dakgun/core/models/post.dart';
import 'package:dakgun/ui/shared/app_colors.dart';
import 'package:dakgun/ui/shared/text_styles.dart';
import 'package:dakgun/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class InfoBarenganView extends StatelessWidget {
  final Post posts;

  const InfoBarenganView({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Info Barengan', style: appBarTitleStyle),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 40.0,
                                width: 40.0,
                                child: Image.asset(
                                  posts.userImg,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              UIHelper.horizontalSpaceSmall,
                              Text(posts.username, style: userStyle),
                            ],
                          ),
                          Text(
                            posts.time,
                            style: TextStyle(color: subtitleTextColor),
                          )
                        ],
                      ),
                      UIHelper.verticalSpaceMedium,
                      InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          Navigator.pushNamed(context, RoutePaths.InfoBarengan);
                        },
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SizedBox(
                                height: screenSize.height * 0.275,
                                width: screenSize.width,
                                child: Image.asset(
                                  posts.img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 24.0,
                              bottom: 24.0,
                              child: Text(posts.title, style: titleImgStyle),
                            )
                          ],
                        ),
                      ),
                      UIHelper.verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon:
                                    Image.asset('assets/images/chat_post.png'),
                                onPressed: () {},
                              ),
                              UIHelper.horizontalSpaceSmall,
                              IconButton(
                                icon: Image.asset(
                                    'assets/images/message_post.png'),
                                onPressed: () {},
                              ),
                              UIHelper.horizontalSpaceSmall,
                              IconButton(
                                icon: Image.asset(
                                    'assets/images/thumb_up_post.png'),
                                onPressed: () {},
                              )
                            ],
                          ),
                          IconButton(
                            icon:
                                Image.asset('assets/images/bookmark_post.png'),
                            onPressed: () {},
                          )
                        ],
                      ),
                      UIHelper.verticalSpaceSmall,
                      Row(
                        children: <Widget>[
                          Text(posts.seen, style: descSmallBoldStyle),
                          UIHelper.horizontalSpaceMedium,
                          Text(posts.vote, style: descSmallBoldStyle),
                        ],
                      ),
                      UIHelper.verticalSpaceSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 16.0,
                                width: 16.0,
                                child: Image.asset(
                                  'assets/images/time_post.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              UIHelper.horizontalSpaceSmall,
                              Text(posts.date, style: dateStyle)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 16.0,
                                width: 16.0,
                                child: Image.asset(
                                  'assets/images/location_post.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              UIHelper.horizontalSpaceSmall,
                              Text('Meeting Point', style: locationStyle)
                            ],
                          )
                        ],
                      ),
                      UIHelper.verticalSpaceMedium,
                      Text(posts.desc, style: descStyle)
                    ],
                  ),
                ),
                Divider(thickness: 1.0),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 40.0,
                                width: 40.0,
                                child: Image.asset(
                                  'assets/images/user_profile4.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              UIHelper.horizontalSpaceSmall,
                              Text('Jenny Cole' + ' ', style: userStyle),
                              Text(
                                '- 2 hours ago',
                                style: TextStyle(color: subtitleTextColor),
                              )
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_up),
                            onPressed: () {},
                          )
                        ],
                      ),
                      //TODO: widget replies
                    ],
                  ),
                ),
                Divider(thickness: 1),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                height: 40.0,
                                width: 40.0,
                                child: Image.asset(
                                  'assets/images/user_profile5.png',
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              UIHelper.horizontalSpaceSmall,
                              Text('Willy Wonka' + ' ', style: userStyle),
                              Text(
                                '- 3 hours ago',
                                style: TextStyle(color: subtitleTextColor),
                              )
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.keyboard_arrow_down),
                            onPressed: () {},
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'Lobortis pharetra posuere amet viverra molestie nunc. Est ipsum',
                                style: descStyle,
                              ),
                            ),
                            Text(
                              '2 Replies',
                              style: TextStyle(color: subtitleTextColor),
                            )
                          ],
                        ),
                      )
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
