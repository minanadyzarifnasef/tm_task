import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamweelytask/core/constants/dimensions_constants.dart';
import 'package:tamweelytask/core/constants/string_constants.dart';

import 'package:tamweelytask/core/theming/widgets/title_text.dart';
import 'package:tamweelytask/core/utils/extension.dart';

import '../../utils/app_utilities.dart';
import '../manager/color_manager.dart';


class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;

  const GradientAppBar({super.key, required this.title, required this.back});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFEF3657), // darker shade
            Color(0xFFD33749), // darker shade

            Color(0xFFAD333A),
          ],
        ),
      ),
      child: AppBar(
        title: TitleText(
          text: title,
          color: whiteColor,
        ),
        backgroundColor: Colors.transparent, // Important to see the gradient
        elevation: 0,
        leadingWidth: 40,
        leading: back
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: edge * 0.5),
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Transform.rotate(
                    angle: AppUtilities().isLTR ?0: 3.14 ,
                    child: SvgPicture.asset(arrowLeft, width: 10, colorFilter: const ColorFilter.mode(whiteColor, BlendMode.srcIn)),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
