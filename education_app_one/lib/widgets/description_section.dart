import 'package:flutter/material.dart';

class DescriptionSection extends StatefulWidget {
  const DescriptionSection({super.key});

  @override
  State<DescriptionSection> createState() => _DescriptionSectionState();
}

class _DescriptionSectionState extends State<DescriptionSection> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam efficitur, nisl at tincidunt sollicitudin, nulla justo volutpat velit, a fermentum lacus arcu ac odio. Integer nec facilisis dui. Praesent euismod dui vel enim aliquam, non tincidunt lectus dictum. Curabitur tristique lectus velit",
            style: TextStyle(fontSize: 16, color: Colors.black),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Course Length: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Icon(
                Icons.timer,
                color: Color(0xFF674AEf),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "26 hours",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Rating",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "4.5",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ],
          )
        ],
      ),
    );
  }
}
