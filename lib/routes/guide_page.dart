import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_365app/common/global.dart';
import 'package:flutter_365app/routes/home_page.dart';

/// guide page
class GuidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GuideState();
}

class _GuideState extends State<GuidePage> {
  PageController _pageController;
  int _currentPage;

  GestureDetector getChildWidget(String path) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image(image: AssetImage(path), fit: BoxFit.cover),
      ),
      onTap: () {
        if (_currentPage == 3) {
          Global.prefs.setBool("isGuide", true);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeRouter();
          }));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PageView.builder(
          itemBuilder: (context, index) {
            return getChildWidget("images/img_page${(index + 1)}.webp");
          },
          itemCount: 4,
          reverse: false,
          controller: _pageController,
          physics: ClampingScrollPhysics(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    _pageController.addListener(() {
      _currentPage = _pageController.page.toInt();
    });
  }
}
