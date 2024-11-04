import 'package:chay_luy/assets/constants.dart';
import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[700],
          ),
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 80,
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Soeun Kimsong",
              style: TextStyle(fontSize: 22, color: white),
            ),
            Text(
              "song@gmail.com",
              style: TextStyle(color: white),
            )
          ],
        )
      ],
    );
  }
}
