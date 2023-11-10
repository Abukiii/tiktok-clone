import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:video_app/Model/videos.dart';
import 'package:video_app/controller/viewController.dart';
import 'package:video_app/screens/content_page.dart';
import 'package:video_app/screens/widgets/menuWidget.dart';
import 'package:video_app/shared/theme_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home'),
    Text('Explore'),
    Text('Search'),
    Text('Notifications'),
    Text('Profile'),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final viewProvider = Provider.of<ViewController>(context);
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              viewProvider.hidemenu();
            },
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ContentScreen(
                    url: Uri.parse(Samplevideos[index].videoLink),
                    caption: Samplevideos[index].caption,
                    time: Samplevideos[index].time);
              },
              itemCount: Samplevideos.length,
              fade: 1.0,
              scrollDirection: Axis.vertical,
            ),
          ),
          viewProvider.fulscreen
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            viewProvider.showmenu();
                          },
                          child: Container(
                              color: AppTheme().white,
                              child: Icon(Icons.menu, color: AppTheme().black)))
                    ],
                  ),
                ),
          viewProvider.fulscreen
              ? Positioned(
                  left: 0,
                  bottom: 90,
                  child: GestureDetector(
                      onTap: () {
                        viewProvider.clearfullscreen();
                      },
                      child: Icon(Icons.arrow_forward)))
              : SizedBox(),
          viewProvider.menuOpen
              ? Positioned(left: 0, top: 0, child: MenuWidget())
              : SizedBox(),

          // Visibility(
          //     visible: viewProvider.menuOpen,
          //     child: Positioned(left: 0, top: 0, child: MenuWidget())),

          viewProvider.fulscreen
              ? SizedBox()
              : Positioned(
                  bottom: 0,
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    color: AppTheme().bottomNavigationBar,
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home, size: 40),
                          label: 'Apps',
                        ),
                        BottomNavigationBarItem(
                          icon: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Icon(
                                Icons.explore,
                                size: 40,
                              ),
                              Positioned(
                                right: -7,
                                top: -5,
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: AppTheme()
                                        .overlay, // You can customize the color
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '25',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          label: 'Qucon',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person_2_outlined, size: 40),
                          label: 'Zaddy',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.telegram_rounded, size: 40),
                          label: 'Organize',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person, size: 40),
                          label: 'Profile',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      selectedItemColor: AppTheme().ActiveIcon,
                      unselectedItemColor: AppTheme().InActiveIcon,
                      onTap: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ),
                ),
        ],
      )),
    );
  }
}
