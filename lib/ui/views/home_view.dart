import 'package:dakgun/core/constants/app_constants.dart';
import 'package:dakgun/ui/shared/app_colors.dart';
import 'package:dakgun/ui/shared/ui_helpers.dart';
import 'package:dakgun/ui/widgets/blogs.dart';
import 'package:dakgun/ui/widgets/news.dart';
import 'package:dakgun/ui/widgets/page_header.dart';
import 'package:dakgun/ui/widgets/trendings.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PageHeader(
                title: 'Discover',
                subtitle: 'Temukan teman & traveling bersama',
                action: IconButton(
                  icon: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/notification_bell.png'),
                      Positioned(
                        top: 5.0,
                        child: Container(
                          height: 12.0,
                          width: 12.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF4747),
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
                widget: _Menu(),
              ),
              Trendings(),
              UIHelper.verticalSpaceSmall,
              News(),
              Blogs()
            ],
          ),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 16.0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.CariBarengan);
              },
              child: _CustomIcon(imageUrl: 'assets/images/barengan.png'),
            ),
            _CustomIcon(imageUrl: 'assets/images/blog.png'),
            _CustomIcon(imageUrl: 'assets/images/berita.png'),
            _CustomIcon(imageUrl: 'assets/images/sewa.png'),
          ],
        ),
      ),
    );
  }
}

class _CustomIcon extends StatelessWidget {
  final String imageUrl;

  const _CustomIcon({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      width: 48.0,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
