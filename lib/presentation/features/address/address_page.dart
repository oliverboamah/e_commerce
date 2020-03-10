// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/config/colors.dart';
import 'package:e_commerce/presentation/widgets/app_bar_with_back_icon.dart';
import 'package:e_commerce/presentation/widgets/input_field.dart';
import 'package:e_commerce/config/dimen.dart';

class AddressPage extends StatefulWidget {
  final String appBarTitle;

  AddressPage({@required this.appBarTitle});

  @override
  State<StatefulWidget> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();

  String _firstName;
  String _lastName;
  String _address;
  String _city;
  String _town;
  String _phoneNumber;
  String _additionalInfo;
  String _additionalPhoneNumber;

  onItemClicked(index) {
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBarWithBackIcon(
          context: context,
          title: this.widget.appBarTitle,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
              children: <Widget>[
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    color: secondaryHighlightColor,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Address Details',
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          '*Required',
                          style: Theme.of(context).textTheme.display3,
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: InputField(
                                    hintText: 'Firstname',
                                    onChanged: (value) => this.setState(
                                        () => this._firstName = value.trim()),
                                    validator: (value) {
                                      if (value.trim().isEmpty) {
                                        return 'Please enter firstname';
                                      }
                                      return null;
                                    }),
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: InputField(
                                      hintText: 'Lastname',
                                      onChanged: (value) => this.setState(
                                          () => this._lastName = value.trim()),
                                      validator: (value) {
                                        if (value.trim().isEmpty) {
                                          return 'Please enter lastname';
                                        }
                                        return null;
                                      }),
                                ),
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: InputField(
                                      hintText: 'Address',
                                      onChanged: (value) => this.setState(
                                          () => this._address = value.trim()),
                                      validator: (value) {
                                        if (value.trim().isEmpty) {
                                          return 'Please enter address';
                                        }
                                        return null;
                                      }),
                                ),
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, right: 10.0),
                                  child: InputField(
                                    hintText: 'Additional Info',
                                    onChanged: (value) => this.setState(() =>
                                        this._additionalInfo = value.trim()),
                                  ),
                                ),
                              ),
                            ],
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
                                    style: Theme.of(context).textTheme.title,
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
                                    onChanged: (value) =>
                                        this.setState(() => this._city = value),
                                    value: this._city,
                                    isExpanded: true,
                                  ),
                                ),
                              ),
                            ],
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
                                    style: Theme.of(context).textTheme.title,
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
                                    onChanged: (value) =>
                                        this.setState(() => this._town = value),
                                    value: this._town,
                                    isExpanded: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: InputField(
                                      hintText: 'Phone number',
                                      onChanged: (value) => this.setState(() =>
                                          this._phoneNumber = value.trim()),
                                      validator: (value) {
                                        if (value.trim().isEmpty) {
                                          return 'Please enter phone number';
                                        }
                                        return null;
                                      }),
                                ),
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                    fontSize: 28,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, top: smallSpacing),
                                  child: InputField(
                                    hintText: 'Additional Phone number',
                                    onChanged: (value) => this.setState(() =>
                                        this._additionalPhoneNumber =
                                            value.trim()),
                                  ),
                                ),
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
                        'SAVE',
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
