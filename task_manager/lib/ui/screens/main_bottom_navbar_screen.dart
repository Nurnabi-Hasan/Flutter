import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/cancel_task_screen.dart';
import 'package:task_manager/ui/screens/complete_task_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/screens/progress_task_screen.dart';
import 'package:task_manager/ui/utils/app_color.dart';

import '../widget/tm_app_bar.dart';

class MainBottomNavbarScreen extends StatefulWidget {
  const MainBottomNavbarScreen({super.key});

  @override
  State<MainBottomNavbarScreen> createState() => _MainBottomNavbarScreenState();
}

class _MainBottomNavbarScreenState extends State<MainBottomNavbarScreen> {
  int _selectIndex = 0;
   final List <Widget> _Screns =const [
      NewTaskScreen(),
      CompleteTaskScreen(),
      CancelTaskScreen(),
      ProgressTaskScreen()
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TM_App_Bar(),
      body: _Screns[_selectIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectIndex,
        indicatorColor: AppColors.themeColor,
        onDestinationSelected: (int index) {
          _selectIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.tab_rounded),
            label: 'New task',
          ),
          NavigationDestination(
            icon: Icon(Icons.task),
            label: 'Compleated',
          ),
          NavigationDestination(
            icon: Icon(Icons.cancel),
            label: 'Canceled',
          ),
          NavigationDestination(
            icon: Icon(Icons.insert_link_rounded),
            label: 'Progress',
          )
        ],
      ),
    );
  }
}


