import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:video_app/Model/videos.dart';
import 'package:video_app/controller/viewController.dart';
import 'package:video_app/screens/content_page.dart';
import 'package:video_app/screens/widgets/appBar.dart';
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
      appBar: CustomAppBar(),
      body: SafeArea(
          child: Stack(
        children: [
          Swiper(
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
          viewProvider.fulscreen
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            showAlertDialog(context);
                          },
                          child: Image.asset(
                            'assets/images/Menu.png',
                            height: 40,
                            width: 40,
                          ))
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
                      child: Image.asset(
                        'assets/images/fullo.png',
                        height: 60,
                        width: 60,
                      )))
              : SizedBox(),
          viewProvider.menuOpen
              ? Positioned(left: 0, top: 0, child: MenuWidget())
              : SizedBox(),
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
                          icon: Image.asset(
                            'assets/images/Vector(1).png', // Replace with the actual path to your home icon
                            height: 30,
                            width: 30,
                          ),
                          label: 'Apps',
                        ),
                        BottomNavigationBarItem(
                          icon: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset(
                                'assets/images/Vector(2).png', // Replace with the actual path to your explore icon
                                height: 30,
                                width: 30,
                              ),
                              Positioned(
                                right: -7,
                                top: -5,
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: AppTheme().overlay,
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
                          icon: Image.asset(
                            'assets/images/Vector(3).png', // Replace with the actual path to your person icon
                            height: 30,
                            width: 30,
                          ),
                          label: 'Zaddy',
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            'assets/images/Vector(4).png', // Replace with the actual path to your telegram icon
                            height: 30,
                            width: 30,
                          ),
                          label: 'Organize',
                        ),
                        BottomNavigationBarItem(
                          icon: Image.asset(
                            'assets/images/Profile.png', // Replace with the actual path to your profile icon
                            height: 30,
                            width: 30,
                          ),
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
