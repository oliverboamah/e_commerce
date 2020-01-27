// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/ui/components/app_bar_with_back_icon.dart';
import 'package:e_commerce/values/dimen.dart';

class LocationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final _formKey = GlobalKey<FormState>();

  String _city;
  String _town;

  onItemClicked(index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBarWithBackIcon(
          context: context,
          title: 'Choose PickUp Location',
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Region',
                                style: Theme.of(context).textTheme.title,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 8.0,
                                        left: 6.0,
                                        right: 16.0,
                                      ),
                                      child: DropdownButton<String>(
                                        style:
                                            Theme.of(context).textTheme.title,
                                        underline: Container(
                                          color: secondaryTextColor,
                                          height: 1,
                                        ),
                                        items: <String>[
                                          'Greater Accra',
                                          'Kumasi',
                                          'Sunyani',
                                          'Obuasi'
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) => this
                                            .setState(() => this._city = value),
                                        value: this._city,
                                        isExpanded: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('City'),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 8.0,
                                        left: 6.0,
                                        right: 16.0,
                                      ),
                                      child: DropdownButton<String>(
                                        style:
                                            Theme.of(context).textTheme.title,
                                        underline: Container(
                                          color: secondaryTextColor,
                                          height: 1,
                                        ),
                                        items: <String>[
                                          'Dzorwulu',
                                          'Madina',
                                          'Tema',
                                          'Lapaz'
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (value) => this
                                            .setState(() => this._town = value),
                                        value: this._town,
                                        isExpanded: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: defaultWidgetPadding),
                decoration: BoxDecoration(color: colorWhite, boxShadow: [
                  BoxShadow(
                      color: dividerColor,
                      offset: Offset(0, -0.5),
                      blurRadius: 0.5)
                ]),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: CupertinoButton(
                      minSize: buttonSize,
                      color: primaryColor,
                      child: Text(
                        'CONFIRM LOCATION',
                        style: Theme.of(context).accentTextTheme.display2,
                      ),
                      onPressed: () {
                        if (this._formKey.currentState.validate()) {}
                      },
                    ),
                  ),
                )),
          ],
        ));
  }
}
