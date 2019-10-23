import 'package:dakgun/core/constants/app_constants.dart';
import 'package:dakgun/core/models/post.dart';
import 'package:dakgun/ui/shared/app_colors.dart';
import 'package:dakgun/ui/shared/text_styles.dart';
import 'package:dakgun/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  final List<Post> posts;

  const Posts({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => UIHelper.verticalSpaceMedium,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        var post = posts[index];
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutePaths.User,
                        arguments: post,
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          height: 40.0,
                          width: 40.0,
                          child: Image.asset(
                            post.userImg,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        UIHelper.horizontalSpaceSmall,
                        Text(post.username, style: userStyle),
                      ],
                    ),
                  ),
                  Text(
                    post.time,
                    style: TextStyle(color: subtitleTextColor),
                  )
                ],
              ),
              UIHelper.verticalSpaceMedium,
              InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.InfoBarengan,
                    arguments: post,
                  );
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
                          post.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24.0,
                      bottom: 24.0,
                      child: Text(post.title, style: titleImgStyle),
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
                        icon: Image.asset('assets/images/chat_post.png'),
                        onPressed: () {},
                      ),
                      UIHelper.horizontalSpaceSmall,
                      IconButton(
                        icon: Image.asset('assets/images/message_post.png'),
                        onPressed: () {},
                      ),
                      UIHelper.horizontalSpaceSmall,
                      IconButton(
                        icon: Image.asset('assets/images/thumb_up_post.png'),
                        onPressed: () {},
                      )
                    ],
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/bookmark_post.png'),
                    onPressed: () {},
                  )
                ],
              ),
              UIHelper.verticalSpaceSmall,
              Row(
                children: <Widget>[
                  Text(post.seen, style: descSmallBoldStyle),
                  UIHelper.horizontalSpaceMedium,
                  Text(post.vote, style: descSmallBoldStyle),
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
                      Text(post.date, style: dateStyle)
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
              Text(
                post.desc,
                style: descStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              )
            ],
          ),
        );
      },
    );
  }
}
