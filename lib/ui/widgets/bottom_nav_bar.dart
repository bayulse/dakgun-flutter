import 'package:dakgun/core/viewmodels/app_model.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appModel = Injector.getAsModel<AppModel>(context: context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: appModel.state.tabIndex,
      onTap: (index) => appModel.setState((state) => state.setTabIndex(index)),
      items: [
        BottomNavigationBarItem(
          icon: _CustomNavIcon(img: 'assets/images/discover_inactive.png'),
          activeIcon: _CustomNavIcon(img: 'assets/images/discover_active.png'),
          title: Text('Discover'),
        ),
        BottomNavigationBarItem(
          icon: _CustomNavIcon(img: 'assets/images/bookmark_inactive.png'),
          activeIcon: _CustomNavIcon(img: 'assets/images/bookmark_active.png'),
          title: Text('Bookmark'),
        ),
        BottomNavigationBarItem(
          icon: _CustomNavIcon(img: 'assets/images/inbox_inactive.png'),
          activeIcon: _CustomNavIcon(img: 'assets/images/inbox_active.png'),
          title: Text('Inbox'),
        ),
        BottomNavigationBarItem(
          icon: _CustomNavIcon(img: 'assets/images/account_inactive.png'),
          activeIcon: _CustomNavIcon(img: 'assets/images/account_active.png'),
          title: Text('Account'),
        )
      ],
    );
  }
}

class _CustomNavIcon extends StatelessWidget {
  final img;

  const _CustomNavIcon({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      width: 24.0,
      child: Image.asset(
        img,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
