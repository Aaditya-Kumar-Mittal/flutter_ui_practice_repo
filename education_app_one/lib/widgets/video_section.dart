import 'package:flutter/material.dart';

class VideoSection extends StatefulWidget {
  final String title;
  const VideoSection({Key? key, required this.title}) : super(key: key);

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  late List<String> videoList;

  @override
  void initState() {
    super.initState();
    videoList = [
      "${widget.title} video 1",
      "${widget.title} video 2",
      "${widget.title} video 3",
      "${widget.title} video 4",
      "${widget.title} video 5",
    ];
  }

  List<String> subTitleList = [
    "20 min 50 sec",
    "24 min 53 sec",
    "35 min 50 sec",
    "45 min 56 sec",
    "36 min 50 sec",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: videoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index == 0
                  ? const Color(0xFF674AEF)
                  : const Color(0xFF674AEF).withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(videoList[index]),
          subtitle: Text(subTitleList[index]), // Wrap in Text widget
        );
      },
    );
  }
}
