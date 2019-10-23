import 'package:dakgun/ui/shared/text_styles.dart';
import 'package:dakgun/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget action;
  final Widget widget;

  const PageHeader(
      {Key key, this.title, this.subtitle, this.action, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title ?? '', style: headerStyle),
              action ?? Container()
            ],
          ),
          UIHelper.verticalSpaceSmall,
          Text(subtitle ?? '', style: subtitleStyle),
          widget ?? Container()
        ],
      ),
    );
  }
}
