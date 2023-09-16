import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:luvit/screens/screens.dart';
import 'package:luvit/utilities/utilities.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _index = 0;
  PageController? _controller;
  final Duration _duration = const Duration(milliseconds: 200);
  final Curve _curves = Curves.easeInOut;

  _pageSwitcher(int index) {
    setState(() {
      _index = index;
    });
    _controller!.animateToPage(
      _index,
      duration: _duration,
      curve: _curves,
    );
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const Location(),
    const Chat(),
    const Profile(),
  ];

  final List<IconData> _iconsList = [
    Icons.home,
    Icons.location_on_outlined,
    Icons.chat_bubble_outline_rounded,
    Icons.person_2_outlined,
  ];

  final List<String> _text = [
    '홈',
    '스팟',
    '채팅',
    '마이',
  ];

  _bottomBar() {
    return AnimatedBottomNavigationBar.builder(
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Palette.pink : Palette.backgroundgreyish;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _iconsList[index],
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                _text[index],
                style: TextStyle(
                  color: isActive ? Palette.pink : Palette.backgroundgreyish,
                ),
              ),
            )
          ],
        );
      },
      splashColor: Colors.transparent,
      splashRadius: 0,
      backgroundColor: Palette.background,
      activeIndex: _index,
      onTap: _pageSwitcher,
      notchSmoothness: NotchSmoothness.sharpEdge,
      gapLocation: GapLocation.center,
      leftCornerRadius: 15,
      rightCornerRadius: 15,
      splashSpeedInMilliseconds: 500,
      itemCount: _iconsList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.appBarBg,
      body: PageView.builder(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _pages[_index];
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Palette.backgroundgreyish,
        child: const Icon(
          Icons.star,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomBar(),
    );
  }
}
