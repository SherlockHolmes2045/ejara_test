import 'package:flutter/material.dart';

class Appbar extends StatelessWidget with PreferredSizeWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(249, 249, 250, 1),
      leading: Container(
        alignment: Alignment.center,
        height: 10,
        width: 10,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(241, 241, 250, 1), shape: BoxShape.circle),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 15,
          color: Color.fromRGBO(118, 126, 237, 1),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
