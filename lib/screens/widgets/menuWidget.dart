import 'package:flutter/material.dart';
import 'package:video_app/shared/theme_data.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width * 0.7,
      color: Colors.white,
      child: ListView(
        children: [
          buildListTile('assets/images/Vector(6).png', Colors.blue,
              'Post a Seequl', context),
          buildListTile('assets/images/Vector(7).png', AppTheme().overlay,
              'View your likes', context),
          buildListTile('assets/images/Vector(8).png', AppTheme().overlay,
              'Your Seequl posts', context),
          buildListTile('assets/images/reference.png',
              AppTheme().commentIconColor, 'Reference contribution', context),
          buildListTile('assets/images/Vector(9).png', AppTheme().overlay,
              'Hashtag challenges', context),
          buildListTile('assets/images/Vector(10).png',
              AppTheme().commentLinkColor, 'Notifications', context),
          buildListTile('assets/images/Vector(11).png',
              const Color.fromARGB(255, 211, 62, 62), 'About SeeQul', context),
        ],
      ),
    );
  }

  ListTile buildListTile(String image, color, String name, context) {
    return ListTile(
      leading: Image.asset(
        image, // Replace with the actual path to your book icon
        height: 30,
        width: 30,
      ),
      title: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: AppTheme().black),
      ),
      onTap: () {
        // Handle list tile tap
      },
    );
  }
}

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned(
            top: 20,
            left: -40,
            child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              clipBehavior: Clip.none,
              content: MenuWidget(),
            ),
          ),
        ],
      );
    },
  );
}
