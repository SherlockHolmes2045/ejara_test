import 'package:flutter/material.dart';

class Appbar extends StatelessWidget with PreferredSizeWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(249, 249, 250, 1),
      leadingWidth: 45,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: InkWell(
          onTap: () => Navigator.of(context).maybePop(),
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(241, 241, 250, 1), shape: BoxShape.circle),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 12,
              color: Color.fromRGBO(118, 126, 237, 1),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
