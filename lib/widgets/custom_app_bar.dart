import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final String? profileImage;
  final VoidCallback onMenuTap;
  final List<Widget>? actions;

  const CustomAppBar({Key? key, this.title, this.subtitle, this.profileImage, required this.onMenuTap, this.actions}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: AppBar(
        backgroundColor: const Color(0xFF121A28),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left: menu + logo
            Row(
              children: [
                GestureDetector(onTap: onMenuTap, child: Image.asset('assets/images/drawer_icon.png', height: 28, width: 28)),
                const SizedBox(width: 8),
                Image.asset('assets/images/rivrLoginLogo.png', height: 36, fit: BoxFit.contain),
              ],
            ),
            // Right: profile avatar
            CircleAvatar(
              radius: 20,
              backgroundImage:
                  profileImage != null ? AssetImage(profileImage!) : const AssetImage('assets/images/profile-avatar.png') as ImageProvider,
            ),
          ],
        ),
        actions: actions,
      ),
    );
  }
}
