import 'package:flutter/material.dart';
import 'persistent_bottom_bar_scaffold.dart';
import 'report_home.dart';
import 'report_list_item.dart';


class HomePage extends StatelessWidget {
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: const TabPage1(),
          icon: Icons.announcement,
          title: 'Report',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: TabPage2(),
          icon: Icons.view_agenda,
          title: 'My Reports',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: const TabPage3(),
          icon: Icons.settings,
          title: 'Settings',
          navigatorkey: _tab3navigatorKey,
        ),
      ],
    );
  }
}

class TabPage1 extends StatelessWidget {
  const TabPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('TabPage1 build');
    return repHome();
  }
}

class TabPage2 extends StatelessWidget {
  TabPage2({super.key});

  final List<String> entries = <String>['Hit stop sign on Mac campus', 'Fender bender in parking lot', 'Minor crash on Main St'];
  final List<String> locations = <String>['1280 Main St W, Hamilton, ON L8S 4L8', '65 Navy Wharf Ct, Toronto, ON M5V 3S2', '310 Main St W, Hamilton, ON L8P 1J8'];
  final List<String> dates = <String>['Feb 28, 2015', 'Nov 3, 2023', 'Mar 6, 2022'];

  // final List<int> colorCodes = <int>[500, 200, 500];

  @override
  Widget build(BuildContext context) {
    // print('TabPage2 build');
    return Scaffold(
      appBar: AppBar(title: const Text('My Reports')),
      body: SizedBox(
        width: double.infinity,
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Text('Tab 2'),
        //     ElevatedButton(
        //         onPressed: () {
        //           Navigator.of(context).push(
        //               MaterialPageRoute(builder: (context) => const Page2('tab2')));
        //         },
        //         child: const Text('Go to page2'))
        //   ],
        // ),
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            // return Container(
            //   height: 150,
            //   color: Colors.amber[colorCodes[index]],
            //   child: Center(
                // child: Text('Entry ${entries[index]}',
            //       style: TextStyle(fontSize: 20.0))
            //   ),
            // );
            return ReportListItem(
              imagePath: 'assets/car.png',
              title: entries[index],
              location: locations[index],
              date: dates[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
    );
  }
}

class TabPage3 extends StatelessWidget {
  const TabPage3({super.key});

  @override
  Widget build(BuildContext context) {
    // print('TabPage3 build');
    return Scaffold(
      appBar: AppBar(title: const Text('Tab 3')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tab 3'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Page2('tab3')));
                },
                child: const Text('Go to page2'))
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final String inTab;

  const Page1(this.inTab, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('in $inTab Page 1'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Page2(inTab)));
                },
                child: const Text('Go to page2'))
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String inTab;

  const Page2(this.inTab, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('in $inTab Page 2'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Page3(inTab)));
                },
                child: const Text('Go to page3'))
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final String inTab;

  const Page3(this.inTab, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('in $inTab Page 3'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Go back'))
          ],
        ),
      ),
    );
  }
}