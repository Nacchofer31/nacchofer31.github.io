import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class SkillIcon extends StatelessWidget {
  const SkillIcon({
    super.key,
    required this.iconPath,
    this.iconColor,
    this.size = 56,
  });

  final String iconPath;
  final String? iconColor;
  final int size;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: size.toDouble(),
          height: size.toDouble(),
          color: HexColor(iconColor ?? '#02569B').withAlpha(50),
          child: SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(
              HexColor(iconColor ?? '#02569B'),
              BlendMode.srcIn,
            ),
            width: size.toDouble(),
            height: size.toDouble(),
          ),
        ),
      );
}
