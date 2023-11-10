import 'package:flutter/material.dart';
import 'package:video_app/screens/reply_page.dart';
import 'package:video_app/shared/theme_data.dart';

Widget comment(comment, name, username, time, profile, context, reply, icons) {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // const Padding(
      //   padding: EdgeInsets.all(8.0),
      //   child: CircleAvatar(
      //     child: Icon(Icons.person, size: 22),
      //     radius: 20,
      //   ),
      // ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage(profile),
          radius: 25,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppTheme().commentUserColor),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(username,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppTheme().commentLinkColor)),
                SizedBox(
                  width: 25,
                ),
                Text(time,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppTheme().commentTimeColor))
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(comment,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppTheme().commentTextColor)),
          ),
          icons
              ? Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.comment,
                          color: AppTheme().commentIconColor),
                      onPressed: () {
                        // showBottomSheett(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReplyScreen()),
                        );
                      },
                    ),
                    Text('15',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppTheme().commentTextColor)),
                    const SizedBox(width: 20),
                    Icon(Icons.favorite, color: AppTheme().commentIconColor),
                    Text('7k',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppTheme().commentTextColor)),
                    const SizedBox(width: 20),
                    Icon(Icons.flag, color: AppTheme().commentIconColor),
                  ],
                )
              : SizedBox(),
          reply
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                    color: AppTheme().numberOfCommentsColor.withOpacity(0.05),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Text("View 15 replies",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppTheme().commentTextColor)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppTheme().commentIconColor,
                      )
                    ]),
                  ),
                )
              : SizedBox()
        ],
      )
    ],
  ));
}
