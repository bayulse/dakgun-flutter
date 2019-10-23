import 'package:dakgun/core/constants/app_constants.dart';
import 'package:dakgun/core/models/post.dart';
import 'package:dakgun/ui/shared/text_styles.dart';
import 'package:dakgun/ui/shared/ui_helpers.dart';
import 'package:dakgun/ui/widgets/posts.dart';
import 'package:dakgun/ui/widgets/trendings.dart';
import 'package:flutter/material.dart';

class CariBarenganView extends StatelessWidget {
  final posts = [
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
      userImg: 'assets/images/user_profile3.png',
      username: 'Carolina Tan',
      userId: '@ctan',
      userBio:
          'Risus aliquam et interdum id at tortor.\nIn libero, id sed accumsan, pharetra. Et,\nfacilisis et.',
      time: 'Dec 25 2019',
      img: 'assets/images/img_pangandaran.png',
      title: 'Pesona Pangandaran...',
      seen: '250 seen',
      vote: '30 vote',
      date: '08 Jan 2019  20:30 PM',
      desc:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices iaculis volutpat nulla condimentum. Urna amet\n\nQuis in lacus, vitae nisl. At posuere senectus in tellus. Viverra vitae eu cras nunc nisl et placerat placerat. Nisl nec nam adipiscing pretium. Sed.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cari Barengan', style: appBarTitleStyle),
          actions: <Widget>[
            IconButton(
              icon: Image.asset('assets/images/search.png'),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Trendings(),
              UIHelper.verticalSpaceMedium,
              Posts(posts: posts),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.tealAccent[400],
          onPressed: () {
            Navigator.pushNamed(context, RoutePaths.PostBarengan);
          },
          child: SizedBox(
            height: 24.0,
            width: 24.0,
            child: Image.asset('assets/images/add_post.png'),
          ),
        ),
      ),
    );
  }
}
