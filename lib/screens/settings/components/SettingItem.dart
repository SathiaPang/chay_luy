import 'package:chay_luy/assets/constants.dart';
import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.title, required this.icon, required this.onClick});

  final String title;
  final IconData icon;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      leading: Container(
        decoration: BoxDecoration(
          color: Color(0x55017F38),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        width: 48,
        height: 48,
        child: Icon(
          icon,
          size: 30,
          color: primeGreen,
        ),
      ),
    );
  }
}
