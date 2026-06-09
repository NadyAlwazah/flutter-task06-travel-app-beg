import 'package:flutter/material.dart';
import 'package:flutter_task06_travel_app_beg/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? action;
  final VoidCallback? onTapAction;
  final VoidCallback? onTapLeading;
  final bool isActionIcon;
  const CustomAppBar({
    super.key,
    this.title,
    this.action,
    this.onTapAction,
    this.isActionIcon = true,
    this.onTapLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,

      // leading
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          backgroundColor: const Color(0xFFF7F7F9),
          radius: 25,

          child: GestureDetector(
            onTap: onTapLeading ?? () => context.pop(),
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
        ),
      ),
      centerTitle: true,

      //title
      title: Text(title ?? '', style: Styles.appBarTitle),

      //actions
      actions: [
        if (action != null)
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: onTapAction,
              child: isActionIcon
                  ? Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xFFF7F7F9),
                      ),
                      child: action,
                    )
                  : action,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
