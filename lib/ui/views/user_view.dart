import 'package:dakgun/core/models/post.dart';
import 'package:dakgun/ui/shared/app_colors.dart';
import 'package:dakgun/ui/shared/text_styles.dart';
import 'package:dakgun/ui/shared/ui_helpers.dart';
import 'package:dakgun/ui/widgets/posts.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  final String user;

  UserView({Key key, this.user}) : super(key: key);

  final postsRudy = [
    Post(
      userImg: 'assets/images/user_profile2.png',
      username: 'Rudy Tabuti',
      userId: '@jonydhoe',
      userBio:
          'Risus aliquam et interdum id at tortor.\nIn libero, id sed accumsan, pharetra. Et,\nfacilisis et.',
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
      userId: '@jonydhoe',
      userBio:
          'Risus aliquam et interdum id at tortor.\nIn libero, id sed accumsan, pharetra. Et,\nfacilisis et.',
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

  final postsCarolina = [
    Post(
      userImg: 'assets/images/user_profile3.png',
      username: 'Carolina Tan',
      userId: '@ctan',
      userBio:
          'Risus aliquam et interdum id at tortor.\nIn libero, id sed accumsan, pharetra. Et,\nfacilisis et.',
      time: '3 hours ago',
      img: 'assets/images/img_pangandaran.png',
      title: 'Pesona Pangandaran...',
      seen: '250 seen',
      vote: '30 vote',
      date: '08 Jan 2019  20:30 PM',
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices iaculis volutpat nulla condimentum. Urna amet\n\nQuis in lacus, vitae nisl. At posuere senectus in tellus. Viverra vitae eu cras nunc nisl et placerat placerat. Nisl nec nam adipiscing pretium. Sed.',
    ),
    Post(
      userImg: 'assets/images/user_profile3.png',
      username: 'Carolina Tan',
      userId: '@ctan',
      userBio:
          'Risus aliquam et interdum id at tortor.\nIn libero, id sed accumsan, pharetra. Et,\nfacilisis et.',
      time: 'Dec 25 2019',
      img: 'assets/images/img_pangandaran.png',
      title: 'Come on join us...',
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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, scrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            padding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF43A689),
                                            Color(0xFF00FFB4)
                                          ],
                                          begin: FractionalOffset(0.0, 0.0),
                                          end: FractionalOffset(0.75, 1.0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
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
                                Text(
                                  user == 'Rudy Tabuti'
                                      ? postsRudy[0].username
                                      : postsCarolina[0].username,
                                  style: subheadStyle,
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  user == 'Rudy Tabuti'
                                      ? postsRudy[0].userId
                                      : postsCarolina[0].userId,
                                  style: subtitleStyle,
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  user == 'Rudy Tabuti'
                                      ? postsRudy[0].userBio
                                      : postsCarolina[0].userBio,
                                  style: descStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: screenSize.height * 0.1,
                        child: RawMaterialButton(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 18.0,
                          ),
                          shape: CircleBorder(),
                          fillColor: Colors.black26,
                          elevation: 0.0,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: screenSize.height * 0.18,
                        child: SizedBox(
                          height: 72.0,
                          width: 72.0,
                          child: Image.asset(
                            user == 'Rudy Tabuti'
                                ? postsRudy[0].userImg
                                : postsCarolina[0].userImg,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                expandedHeight: 380.0,
                bottom: TabBar(
                  labelColor: dateMeetingTextColor,
                  labelStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelColor: subtitleTextColor,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  indicatorColor: dateMeetingTextColor,
                  tabs: <Widget>[
                    Tab(text: 'Postings'),
                    Tab(text: 'Bookmarks'),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Posts(posts: user == 'Rudy Tabuti' ? postsRudy : postsCarolina),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
