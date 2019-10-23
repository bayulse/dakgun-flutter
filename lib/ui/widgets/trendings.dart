import 'package:dakgun/core/models/trending.dart';
import 'package:dakgun/ui/shared/text_styles.dart';
import 'package:dakgun/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class Trendings extends StatelessWidget {
  final trendingList = [
    Trending(
        userImg: 'assets/images/user_profile.png',
        username: 'Roy Ricardo',
        img: 'assets/images/img_backdrop.png',
        title: 'Open Trip Lawu',
        desc: 'Lorem ipsum dolor sit amet,\nconsecte..'),
    Trending(
        userImg: 'assets/images/user_profile1.png',
        username: 'Rachel Maryam',
        img: 'assets/images/img_backdrop1.png',
        title: 'Labuan Bajo',
        desc: 'Vestibulum commodo venenatis,\ninteger..')
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 20.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Trending', style: subheadStyle),
          UIHelper.verticalSpaceMedium,
          Container(
            height: screenSize.aspectRatio <= 0.6
                ? screenSize.height * 0.275
                : screenSize.height * 0.3,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: trendingList.length,
              itemBuilder: (context, index) {
                var trendings = trendingList[index];
                return Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              height: 40.0,
                              width: 40.0,
                              child: Image.asset(
                                trendings.userImg,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            UIHelper.horizontalSpaceSmall,
                            Text(trendings.username, style: userStyle),
                          ],
                        ),
                        UIHelper.verticalSpaceSmall,
                        Stack(
                          children: <Widget>[
                            Container(
                              height: screenSize.height * 0.15,
                              width: screenSize.width * 0.6,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  trendings.img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child:
                                  Text(trendings.title, style: titleImgStyle),
                            )
                          ],
                        ),
                        UIHelper.verticalSpaceSmall,
                        Text(trendings.desc, style: descStyle),
                      ],
                    ),
                    UIHelper.horizontalSpaceMedium
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
