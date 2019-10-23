import 'package:dakgun/core/models/blog.dart';
import 'package:dakgun/ui/shared/text_styles.dart';
import 'package:dakgun/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class Blogs extends StatelessWidget {
  final blogs = [
    Blog(
        bgImg: 'assets/images/review_img.png',
        desc: 'Lorem ipsum dolor sit amet,\nconsecte..',
        title: 'REVIEW'),
    Blog(
        bgImg: 'assets/images/blog_img.png',
        desc: 'Vestibulum commodo venenatis,\ninteger..',
        title: 'BLOG'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 20.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage('assets/images/referensi_bg.png'),
            fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Referensi Traveling', style: subheadStyle),
          UIHelper.verticalSpaceMedium,
          Container(
            height: screenSize.height * 0.35,
            width: screenSize.width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                var blog = blogs[index];
                return Row(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SizedBox(
                            height: screenSize.height * 0.5,
                            width: screenSize.width * 0.6,
                            child: Image.asset(
                              blog.bgImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                            color: Colors.white,
                          ),
                          height: screenSize.aspectRatio <= 0.6
                              ? screenSize.height * 0.1
                              : screenSize.height * 0.12,
                          width: screenSize.width * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(blog.title, style: refCategoryStyle),
                              UIHelper.verticalSpaceSmall,
                              Text(blog.desc, style: descSmallStyle)
                            ],
                          ),
                        ),
                      ],
                    ),
                    UIHelper.horizontalSpaceMedium
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
