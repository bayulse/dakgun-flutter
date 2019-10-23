import 'package:dakgun/core/viewmodels/app_model.dart';
import 'package:dakgun/ui/views/account_view.dart';
import 'package:dakgun/ui/views/bookmark_view.dart';
import 'package:dakgun/ui/views/home_view.dart';
import 'package:dakgun/ui/views/inbox_view.dart';
import 'package:dakgun/ui/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Widget> tabs = [
    HomeView(),
    BookmarkView(),
    InboxView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [Inject<AppModel>(() => AppModel())],
      builder: (context, __) {
        final appModel = Injector.getAsModel<AppModel>(context: context);
        return StateBuilder(
          viewModels: [appModel],
          builder: (_, __) {
            switch (appModel.state.tabIndex) {
              case 0:
                return SafeArea(
                  child: Scaffold(
                    body: Builder(
                      builder: (_) => WillPopScope(
                        onWillPop: () => onWillPop(_),
                        child: HomeView(),
                      ),
                    ),
                    bottomNavigationBar: BottomNavBar(),
                  ),
                );
              case 1:
                return SafeArea(
                  child: Scaffold(
                    body: Builder(
                      builder: (_) => WillPopScope(
                        onWillPop: () => onWillPop(_),
                        child: BookmarkView(),
                      ),
                    ),
                    bottomNavigationBar: BottomNavBar(),
                  ),
                );
              case 2:
                return SafeArea(
                  child: Scaffold(
                    body: Builder(
                      builder: (_) => WillPopScope(
                        onWillPop: () => onWillPop(_),
                        child: InboxView(),
                      ),
                    ),
                    bottomNavigationBar: BottomNavBar(),
                  ),
                );
              case 3:
                return Scaffold(
                  body: Builder(
                    builder: (_) => WillPopScope(
                      onWillPop: () => onWillPop(_),
                      child: AccountView(),
                    ),
                  ),
                  bottomNavigationBar: BottomNavBar(),
                );
              default:
                return SafeArea(
                  child: Scaffold(
                    body: Builder(
                      builder: (_) => WillPopScope(
                        onWillPop: () => onWillPop(_),
                        child: HomeView(),
                      ),
                    ),
                    bottomNavigationBar: BottomNavBar(),
                  ),
                );
            }
          },
        );
      },
    );
  }

  DateTime backButtonPressTime;
  static const snackBarDuration = Duration(seconds: 3);
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    content: Text(
      'Tap sekali lagi untuk keluar',
      textAlign: TextAlign.center,
    ),
    duration: snackBarDuration,
  );

  Future<bool> onWillPop(_) async {
    DateTime currentTime = DateTime.now();

    bool backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
        backButtonPressTime == null ||
            currentTime.difference(backButtonPressTime) > snackBarDuration;

    if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
      backButtonPressTime = currentTime;
      Scaffold.of(_).showSnackBar(snackBar);
      return false;
    }
    return true;
  }
}
