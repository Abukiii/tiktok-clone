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
          buildListTile(Icons.add, Colors.blue, 'Post a Seequl', context),
          buildListTile(
              Icons.favorite, AppTheme().overlay, 'View your likes', context),
          buildListTile(
              Icons.person, AppTheme().overlay, 'Your Seequl posts', context),
          buildListTile(Icons.book, AppTheme().commentIconColor,
              'Reference contribution', context),
          buildListTile(Icons.timelapse, AppTheme().overlay,
              'Hashtag challenges', context),
          buildListTile(Icons.notifications, AppTheme().commentLinkColor,
              'Notifications', context),
          buildListTile(Icons.help, const Color.fromARGB(255, 211, 62, 62),
              'About SeeQul', context),
        ],
      ),
    );
  }

  ListTile buildListTile(IconData icon, color, String name, context) {
    return ListTile(
      leading: Icon(
        icon,
        color: color,
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
