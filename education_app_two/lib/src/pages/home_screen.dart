import 'package:education_app_two/src/helper/quad_clipper.dart';
import 'package:education_app_two/src/pages/recommended_page.dart';
import 'package:education_app_two/src/themes/color/color_scheme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: LightColor.Purple,
        unselectedItemColor: Colors.grey.shade300,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: 0,
        items: [
          _bottomIcons(Icons.home),
          _bottomIcons(Icons.star_border),
          _bottomIcons(Icons.book),
          _bottomIcons(Icons.person),
        ],
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const RecommendedPage()),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _header(context),
            const SizedBox(
              height: 25,
            ),
            _categoryRow("Featured", LightColor.orange, LightColor.orange),
            _featuredRowA(context),
            const SizedBox(
              height: 10,
            ),
            _categoryRow("Featured", LightColor.Purple, LightColor.darkPurple),
            _featuredRowB(context),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomIcons(IconData icon) {
    return BottomNavigationBarItem(icon: Icon(icon), label: "");
  }

  Positioned _smallContainer(Color primary, double top, double left,
      {double radius = 10}) {
    return Positioned(
        top: top,
        left: left,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: primary.withAlpha(255),
        ));
  }

  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Container(
        height: 250,
        width: width,
        decoration: const BoxDecoration(
          color: LightColor.Purple,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 30,
              right: -100,
              child: _circularContainer(300, LightColor.lightPurple),
            ),
            Positioned(
              top: -100,
              left: -45,
              child: _circularContainer(width * .5, LightColor.darkPurple),
            ),
            Positioned(
              top: -180,
              right: -100,
              child: _circularContainer(width * .7, Colors.transparent,
                  borderColor: Colors.white, borderWidth: 2),
            ),
            Positioned(
              top: 40,
              left: 0,
              child: Container(
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Search Courses",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Type Something...",
                          style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circularContainer(double height, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
    );
  }

  Widget _categoryRow(String title, Color primary, Color textColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: LightColor.titleTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          _chip("See all", primary)
        ],
      ),
    );
  }

  Widget _chip(String text, Color textColor,
      {double height = 0, bool isPrimaryCard = false}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: height),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        border: Border.all(
            color: isPrimaryCard ? Colors.white : Colors.transparent, width: 1),
        color: textColor.withAlpha(isPrimaryCard ? 200 : 55),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isPrimaryCard ? Colors.white : textColor,
            fontSize: 15,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _featuredRowA(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _card(
            context,
            primary: LightColor.orange,
            backWidget: _decorationContainerA(LightColor.lightOrange, 50, -30),
            chipColor: LightColor.orange,
            chipText1: "Find the right degree for you",
            chipText2: "8 Courses",
            isPrimaryCard: true,
            imgPath:
                "https://d1mo3tzxttab3n.cloudfront.net/static/img/shop/560x580/vint0080.jpg",
          ),
          _card(
            context,
            primary: Colors.white,
            backWidget: _decorationContainerB(Colors.white, 90, -40),
            chipColor: LightColor.seaBlue,
            chipText1: "Become a Data Scientist",
            chipText2: "8 Courses",
            imgPath:
                "https://hips.hearstapps.com/esquireuk.cdnds.net/16/39/980x980/square-1475143834-david-gandy.jpg?resize=480:*",
          ),
          _card(
            context,
            primary: Colors.white,
            backWidget: _decorationContainerC(Colors.white, 50, -30),
            chipColor: LightColor.orange,
            chipText1: "Become a Digital Marketer",
            chipText2: "8 Courses",
            imgPath:
                "https://www.visafranchise.com/wp-content/uploads/2019/05/patrick-findaro-visa-franchise-square.jpg",
          ),
          _card(
            context,
            primary: Colors.white,
            backWidget: _decorationContainerD(LightColor.seaBlue, -50, 30,
                secondary: LightColor.lightSeaBlue,
                secondaryAccent: LightColor.darkSeaBlue),
            chipColor: LightColor.seaBlue,
            chipText1: "Become a Machine Learner",
            chipText2: "8 Courses",
            imgPath:
                "https://i.dailymail.co.uk/i/pix/2016/08/05/19/36E9139400000578-3725856-image-a-58_1470422921868.jpg",
          ),
        ],
      ),
    );
  }

  Widget _featuredRowB(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _card(
            context,
            primary: LightColor.seaBlue,
            chipColor: LightColor.seaBlue,
            backWidget: _decorationContainerD(LightColor.darkSeaBlue, 100, 155,
                secondary: LightColor.lightSeaBlue,
                secondaryAccent: LightColor.seaBlue),
            chipText1: "English for Career Development ",
            chipText2: "8 Courses",
            isPrimaryCard: true,
            imgPath:
                "https://www.visafranchise.com/wp-content/uploads/2019/05/patrick-findaro-visa-franchise-square.jpg",
          ),
          _card(context,
              primary: Colors.white,
              chipColor: LightColor.lightPurple,
              backWidget: _decorationContainerE(
                LightColor.lightPurple,
                90,
                -40,
                secondary: LightColor.lightSeaBlue,
              ),
              chipText1: "Business Foundation",
              chipText2: "8 Courses",
              imgPath:
                  "https://i.dailymail.co.uk/i/pix/2016/08/05/19/36E9139400000578-3725856-image-a-58_1470422921868.jpg"),
          _card(
            context,
            primary: Colors.white,
            chipColor: LightColor.lightOrange,
            backWidget: _decorationContainerF(
                LightColor.lightOrange, LightColor.orange, 50, -30),
            chipText1: "Excel Skills for Business",
            chipText2: "8 Courses",
            imgPath:
                "https://hips.hearstapps.com/esquireuk.cdnds.net/16/39/980x980/square-1475143834-david-gandy.jpg?resize=480:*",
          ),
          _card(context,
              primary: Colors.white,
              chipColor: LightColor.darkBlue,
              backWidget: _decorationContainerA(
                LightColor.yellow,
                -50,
                30,
              ),
              chipText1: "Become a Data Analyst",
              chipText2: "8 Courses",
              imgPath:
                  "https://d1mo3tzxttab3n.cloudfront.net/static/img/shop/560x580/vint0080.jpg"),
        ],
      ),
    );
  }

  Widget _card(
    BuildContext context, {
    required Color primary,
    required Widget backWidget,
    required Color chipColor,
    required String chipText1,
    required String chipText2,
    String imgPath = "",
    bool isPrimaryCard = false,
  }) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: isPrimaryCard ? 250 : 240,
      width: isPrimaryCard ? width * .55 : width * .50,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 10,
            color: LightColor.grey.withOpacity(.5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: <Widget>[
            backWidget,
            Positioned(
              top: 20,
              left: 20,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: NetworkImage(imgPath),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              child: _cardInfo(context, chipText1, chipText2,
                  LightColor.titleTextColor, chipColor,
                  isPrimaryCard: isPrimaryCard),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardInfo(BuildContext context, String title, String courses,
      Color textColor, Color primary,
      {bool isPrimaryCard = false}) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 10),
            width: MediaQuery.of(context).size.width * .42,
            alignment: Alignment.topCenter,
            child: Text(
              textAlign: TextAlign.left,
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isPrimaryCard ? Colors.white : textColor,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          _chip(courses, primary, height: 5, isPrimaryCard: isPrimaryCard)
        ],
      ),
    );
  }

  Widget _decorationContainerF(
      Color primary, Color secondary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 25,
          right: -20,
          child: RotatedBox(
            quarterTurns: 1,
            child: ClipRect(
              clipper: QuadClipper(),
              child: CircleAvatar(
                backgroundColor: primary.withAlpha(100),
                radius: 50,
              ),
            ),
          ),
        ),
        Positioned(
          top: 47,
          right: 2,
          child: RotatedBox(
            quarterTurns: 2,
            child: ClipRect(
              clipper: QuadClipper(),
              child: CircleAvatar(
                backgroundColor: secondary.withAlpha(100),
                radius: 30,
              ),
            ),
          ),
        ),
        Positioned(
          top: 34,
          right: -8,
          child: ClipRect(
            clipper: QuadClipper(),
            child: CircleAvatar(
              backgroundColor: secondary.withAlpha(100),
              radius: 40,
            ),
          ),
        ),
        _smallContainer(LightColor.yellow, 15, 90, radius: 5),
        Positioned(
          top: 45,
          left: 35,
          child: CircleAvatar(
            backgroundColor: LightColor.yellow.withOpacity(0.5),
            radius: 50,
          ),
        ),
      ],
    );
  }

  Widget _decorationContainerE(Color primary, double top, double left,
      {required Color secondary}) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -105,
          left: -35,
          child: CircleAvatar(
            backgroundColor: primary.withAlpha(100),
            radius: 70,
          ),
        ),
        Positioned(
          top: 40,
          right: -25,
          child: ClipRect(
            clipper: QuadClipper(),
            child: CircleAvatar(
              backgroundColor: primary,
              radius: 40,
            ),
          ),
        ),
        Positioned(
          top: 45,
          right: -50,
          child: ClipRect(
            clipper: QuadClipper(),
            child: CircleAvatar(
              backgroundColor: secondary,
              radius: 50,
            ),
          ),
        ),
        _smallContainer(LightColor.yellow, 15, 90, radius: 15),
        Positioned(
          bottom: -50,
          right: -35,
          child: CircleAvatar(
            backgroundColor: primary.withAlpha(100),
            radius: 70,
          ),
        ),
      ],
    );
  }

  Widget _decorationContainerD(Color primary, double top, double left,
      {required Color secondary, required Color secondaryAccent}) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: CircleAvatar(
            backgroundColor: secondary,
            radius: 100,
          ),
        ),
        _smallContainer(LightColor.yellow.withOpacity(0.1), 170, 135,
            radius: 20),
        Positioned(
          top: 40,
          left: -50,
          child: CircleAvatar(
            backgroundColor: primary,
            radius: 80,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: secondaryAccent,
            ),
          ),
        ),
        Positioned(
          top: -30,
          right: -40,
          child: _circularContainer(80, Colors.transparent,
              borderColor: Colors.white),
        ),
      ],
    );
  }

  Widget _decorationContainerC(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -55,
          left: 35,
          child: CircleAvatar(
            backgroundColor: LightColor.orange.withAlpha(100),
            radius: 60,
          ),
        ),
        Positioned(
          top: 35,
          right: -60,
          child: ClipRect(
            clipper: QuadClipper(),
            child: const CircleAvatar(
              backgroundColor: LightColor.orange,
              radius: 50,
            ),
          ),
        ),
        _smallContainer(LightColor.yellow, 35, 120, radius: 15),
      ],
    );
  }

  Widget _decorationContainerB(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -65,
          right: 50,
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            radius: 70,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: primary,
            ),
          ),
        ),
        Positioned(
          top: 35,
          right: -70,
          child: ClipRect(
            clipper: QuadClipper(),
            child: const CircleAvatar(
              backgroundColor: LightColor.lightSeaBlue,
              radius: 60,
            ),
          ),
        ),
      ],
    );
  }

  Widget _decorationContainerA(Color primary, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: CircleAvatar(
            backgroundColor: primary.withAlpha(255),
            radius: 100,
          ),
        ),
        _smallContainer(primary, 20, 40),
        Positioned(
          top: 20,
          right: -30,
          child: _circularContainer(80, Colors.transparent,
              borderColor: Colors.white),
        ),
      ],
    );
  }
}
