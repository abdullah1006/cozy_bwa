class NavBarItem {
  int? index;
  String? imageUrl;

  NavBarItem({
    this.imageUrl,
    this.index,
  });
}

List<NavBarItem> navBarItems = [
  NavBarItem(
    index: 0,
    imageUrl: 'assets/icon/icon_home.png',
  ),
  NavBarItem(
    index: 1,
    imageUrl: 'assets/icon/icon_email.png',
  ),
  NavBarItem(
    index: 2,
    imageUrl: 'assets/icon/icon_card.png',
  ),
  NavBarItem(
    index: 3,
    imageUrl: 'assets/icon/icon_love.png',
  ),
];
