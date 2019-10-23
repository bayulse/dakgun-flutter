class AppModel {
  int tabIndex = 0;
  bool tabPopStack = false;

  void setTabIndex(int index) {
    tabPopStack = tabIndex == index;
    tabIndex = index;
  }
}
