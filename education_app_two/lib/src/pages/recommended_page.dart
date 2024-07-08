import 'package:education_app_two/src/helper/courseModel.dart';
import 'package:education_app_two/src/helper/quad_clipper.dart';
import 'package:education_app_two/src/pages/home_screen.dart';
import 'package:education_app_two/src/themes/color/color_scheme.dart';
import 'package:education_app_two/src/themes/theme.dart';
import 'package:flutter/material.dart';

class RecommendedPage extends StatelessWidget {
  const RecommendedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: LightColor.background,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: LightColor.Purple,
        unselectedItemColor: Colors.grey.shade300,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        items: [
          _bottomIcons(Icons.home),
          _bottomIcons(Icons.star_border),
          _bottomIcons(Icons.book),
          _bottomIcons(Icons.person),
        ],
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _header(context),
            const SizedBox(
              height: 10,
            ),
            _categoryRow(context, "Start a new career"),
            _courseList(context),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomIcons(IconData icon) {
    return BottomNavigationBarItem(icon: Icon(icon), label: '');
  }

  Widget _header(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Container(
        height: 120,
        width: width,
        decoration: const BoxDecoration(
          color: LightColor.orange,
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 10,
              right: -120,
              child: _circularContainer(300, LightColor.lightOrange2),
            ),
            Positioned(
              top: -60,
              left: -65,
              child: _circularContainer(width * .5, LightColor.darkOrange),
            ),
            Positioned(
              top: -230,
              right: -30,
              child: _circularContainer(width * .7, Colors.transparent,
                  borderColor: Colors.white38, borderWidth: 2),
            ),
            Positioned(
              top: 50,
              left: 0,
              child: Container(
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Stack(
                  children: <Widget>[
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 40,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Recommended",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
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

  Widget _categoryRow(BuildContext context, String title) {
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: const TextStyle(
                color: LightColor.extraDarkPurple,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                const SizedBox(width: 20),
                _chip("Data Scientist", LightColor.yellow, height: 4),
                const SizedBox(width: 10),
                _chip("Data Analyst", LightColor.seaBlue, height: 4),
                const SizedBox(width: 10),
                _chip("Data Engineer", LightColor.orange, height: 4),
                const SizedBox(width: 10),
                _chip("Data Scientist", LightColor.LightBlue, height: 4),
              ],
            ),
          ),
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
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: textColor, width: 0.9),
        color: textColor.withAlpha(isPrimaryCard ? 200 : 50),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isPrimaryCard ? Colors.white : textColor,
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _courseList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _courseInfo(context, CourseList.list[0],
                _decorationContainerA(Colors.redAccent, -100, -85),
                background: LightColor.seaBlue),
            const Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            _courseInfo(context, CourseList.list[1], _decorationContainerB(),
                background: LightColor.darkOrange),
            const Divider(
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            _courseInfo(context, CourseList.list[2], _decorationContainerC(),
                background: LightColor.lightOrange2),
          ],
        ),
      ),
    );
  }

  Widget _courseInfo(BuildContext context, CourseModel model, Widget decoration,
      {required Color background}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: .7,
              child: _card(context,
                  primaryColor: background, backWidget: decoration),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          model.name.toString(),
                          style: const TextStyle(
                            color: LightColor.Purple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: background,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        model.noOfCourses.toString(),
                        style: const TextStyle(
                            color: LightColor.grey, fontSize: 15),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Text(
                    model.university.toString(),
                    style: AppTheme.h6Style.copyWith(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    model.description.toString(),
                    style: AppTheme.h6Style.copyWith(
                        fontSize: 13, color: LightColor.extraDarkPurple),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      _chip(model.tag1.toString(), LightColor.darkOrange,
                          height: 5),
                      const SizedBox(
                        width: 10,
                      ),
                      _chip(model.tag2.toString(), LightColor.seaBlue,
                          height: 5),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(BuildContext context,
      {Color primaryColor = Colors.redAccent, required Widget backWidget}) {
    return Container(
      height: 190,
      width: MediaQuery.of(context).size.width * .34,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(0, 5),
            blurRadius: 10,
            color: Colors.grey.shade500,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: backWidget,
      ),
    );
  }

  Widget _decorationContainerA(Color primaryColor, double top, double left) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: const CircleAvatar(
            radius: 100,
            backgroundColor: LightColor.darkSeaBlue,
          ),
        ),
        _smallContainer(LightColor.yellow, 40, 20),
        Positioned(
          top: -30,
          right: -10,
          child: _circularContainer(80, Colors.transparent,
              borderColor: Colors.white),
        ),
        const Positioned(
          top: 110,
          right: -50,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: LightColor.darkSeaBlue,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: LightColor.seaBlue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _decorationContainerB() {
    return Stack(
      children: <Widget>[
        const Positioned(
          top: -65,
          left: -65,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: LightColor.lightOrange2,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: LightColor.darkOrange,
            ),
          ),
        ),
        const Positioned(
          bottom: -35,
          right: -40,
          child: CircleAvatar(
            backgroundColor: LightColor.yellow,
            radius: 40,
          ),
        ),
        Positioned(
          top: 50,
          left: -40,
          child: _circularContainer(70, Colors.transparent,
              borderColor: Colors.white),
        ),
      ],
    );
  }

  Widget _decorationContainerC() {
    return Stack(
      children: <Widget>[
        const Positioned(
          top: -65,
          left: -35,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Color(0xfffeeaea),
          ),
        ),
        Positioned(
          bottom: -30,
          right: -25,
          child: ClipRect(
            clipper: QuadClipper(),
            child: const CircleAvatar(
              backgroundColor: LightColor.yellow,
              radius: 40,
            ),
          ),
        ),
        _smallContainer(Colors.yellow, 35, 70),
      ],
    );
  }

  Positioned _smallContainer(Color primaryColor, double top, double left,
      {double radius = 10}) {
    return Positioned(
      top: top,
      left: left,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: primaryColor.withAlpha(255),
      ),
    );
  }
}
