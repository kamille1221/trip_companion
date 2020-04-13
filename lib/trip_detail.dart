import 'package:flutter/cupertino.dart';

class TripDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TripDetailState();
  }
}

class _TripDetailState extends State<TripDetail> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      child: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle,
        child: CupertinoScrollbar(
            child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  _buildTitleField(),
                  _buildScheduleField(),
                  _buildLocationField(),
                ],
              ),
            )
          ],
        )),
      ),
      navigationBar: const CupertinoNavigationBar(
        middle: const Text('France Trip'),
      ),
    );
  }

  Widget _buildTitleField() {
    return CupertinoTextField(
      prefix: const Icon(
        null,
        color: CupertinoColors.lightBackgroundGray,
        size: 28.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      decoration: const BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 0.0, color: CupertinoColors.inactiveGray)),
      ),
      placeholder: 'Title',
    );
  }

  Widget _buildLocationField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.location_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      decoration: const BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 0.0, color: CupertinoColors.inactiveGray)),
      ),
      placeholder: 'Location',
    );
  }
  
  Widget _buildScheduleField() {
    return CupertinoTextField(
      prefix: const Icon(
        CupertinoIcons.time_solid,
        color: CupertinoColors.lightBackgroundGray,
        size: 28.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
      clearButtonMode: OverlayVisibilityMode.editing,
      textCapitalization: TextCapitalization.words,
      decoration: const BoxDecoration(
        border: Border(
            bottom:
                BorderSide(width: 0.0, color: CupertinoColors.inactiveGray)),
      ),
      placeholder: 'Schedule',
    );
  }

}
