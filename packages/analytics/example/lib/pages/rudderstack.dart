import 'package:analytics/sdk/rudderstack/models/user_info.dart';
import 'package:analytics/sdk/rudderstack/sdk/deriv_rudderstack_sdk.dart';
import 'package:flutter/material.dart';

class RudderStack extends StatefulWidget {
  // ignore: public_member_api_docs
  const RudderStack({super.key});

  @override
  _RudderStackState createState() => _RudderStackState();
}

class _RudderStackState extends State<RudderStack> {
  bool _enabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Rudderstack example app'),
            //back button
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            ),
          ),
          body: SingleChildScrollView(
            child: Builder(
              builder: (BuildContext context) => Column(
                children: <Widget>[
                  _enableController(context),
                  const Divider(),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding: const EdgeInsets.all(16),
                    children: _eventsList(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  List<Widget> _eventsList(BuildContext context) => <Widget>[
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Center(
                child: Text(
              'Identify',
              style: TextStyle(fontSize: 18),
            )),
          ),
          onTap: () async {
            await DerivRudderstack()
                .setContext(token: 'xxx-xxxx-xxxx-xxxxx-xxxx-test');
            final bool result = await DerivRudderstack()
                .identify(userInfo: UserInfo(userId: 988));
            _showSnackBar(context, result);
          },
        ),
        InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blue[100],
              child: const Center(
                  child: Text(
                'Track',
                style: TextStyle(fontSize: 18),
              )),
            ),
            onTap: () async {
              final bool result = await DerivRudderstack()
                  .track(eventName: 'Application Opened');

              _showSnackBar(context, result);
            }),
        InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.orange[100],
              child: const Center(
                  child: Text(
                'Screen',
                style: TextStyle(fontSize: 18),
              )),
            ),
            onTap: () async {
              final bool result =
                  await DerivRudderstack().screen(screenName: 'main');

              _showSnackBar(context, result);
            }),
        InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.indigo[100],
              child: const Center(
                  child: Text(
                'group',
                style: TextStyle(fontSize: 18),
              )),
            ),
            onTap: () async {
              final bool result =
                  await DerivRudderstack().group(groupId: 'Group-id-test');
              _showSnackBar(context, result);
            }),
        InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.purple[100],
              child: const Center(
                  child: Text(
                'alias',
                style: TextStyle(fontSize: 18),
              )),
            ),
            onTap: () async {
              final bool result =
                  await DerivRudderstack().alias(alias: 'Alias-test');
              _showSnackBar(context, result);
            }),
        InkWell(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.deepOrange[100],
              child: const Center(
                  child: Text(
                'reset',
                style: TextStyle(fontSize: 18),
              )),
            ),
            onTap: () async {
              final bool result = await DerivRudderstack().reset();
              _showSnackBar(context, result);
            }),
      ];

  Widget _enableController(BuildContext context) => SwitchListTile(
        title: const Text('Enable RudderStack'),
        value: _enabled,
        onChanged: (bool newValue) async {
          setState(() => _enabled = newValue);

          bool result;
          if (_enabled) {
            result = await DerivRudderstack().enable();
          } else {
            result = await DerivRudderstack().disable();
          }

          _showSnackBar(context, result);
        },
      );

  void _showSnackBar(BuildContext context, bool success) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(success ? 'Success' : 'Failure')),
      );
}
