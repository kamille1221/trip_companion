import 'package:flutter/cupertino.dart';
import 'package:trip_companion/trip_add.dart';
import 'package:trip_companion/trip_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      routes: {
        '/': (BuildContext context) => MyHomePage(
              title: 'Trip companion',
            ),
        '/trip_add': (_) => TripAdd(),
        '/trip_detail': (_) => TripDetail()
      },
      // home: MyHomePage(title: 'Trip Companion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: const Text('Trip Companion'),
              trailing: trailingButtons,
            ),
            CupertinoSliverRefreshControl(
              onRefresh: () {
                return Future<void>.delayed(const Duration(seconds: 1))
                  ..then<void>((_) {
                    if (mounted) {
                      setState(() => null
                          //refreshTripList()
                          );
                    }
                  });
              },
            ),
            SliverSafeArea(
                top: false,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return _TripItem(
                        title: 'France Trip',
                        location: 'Paris, France',
                        schedule: '2019-10-31',
                        thumbnail: 'https://i.picsum.photos/id/1/1600/900.jpg',
                      );
                    },
                    childCount: 10,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

final Widget trailingButtons = Row(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    const AddButton(),
    // const Padding(padding: EdgeInsets.only(left: 8.0),),
    const SettingButton(),
  ],
);

class AddButton extends StatelessWidget {
  const AddButton();

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Icon(CupertinoIcons.add),
      // child: Text('Add'),
      onPressed: () => Navigator.pushNamed(context, '/trip_add'),
    );
  }
}

class SettingButton extends StatelessWidget {
  const SettingButton();

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Icon(CupertinoIcons.settings),
      // child: Text('Settings'),
      onPressed: () {
        showCupertinoDialog<String>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Setting'),
            content: const Text(
                'When press this button then show setting view. However it is not implemented yet.'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('OK'),
                isDefaultAction: true,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ).then(
          (String value) {},
        );
      },
    );
  }
}

class _TripItem extends StatelessWidget {
  const _TripItem({
    this.title,
    this.location,
    this.schedule,
    this.thumbnail,
  });
  final String title;
  final String location;
  final String schedule;
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/trip_detail'),
      child: Container(
        color: CupertinoDynamicColor.resolve(
            CupertinoColors.systemGroupedBackground, context),
        padding: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        height: 256.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Image.network(
                thumbnail,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(fontSize: 24.0),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      location,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      schedule,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
