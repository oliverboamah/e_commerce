// flutter imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// my app imports
import 'package:e_commerce/ui/components/app_bar_with_hamburger.dart';
import 'package:e_commerce/values/colors.dart';
import 'package:e_commerce/ui/components/secondary_section_header.dart';
import 'package:e_commerce/values/dimen.dart';

class SupportTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SupportTabState();
}

class _SupportTabState extends State<SupportTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBarWithHamburger(
        context: context,
        title: 'Support',
        onHamburgerClicked: () {
          print('hamburger clicked');
        },
      ),
      body: Column(
        children: <Widget>[
          SecondarySectionHeader(title: 'About E-Commerce'),
          InkWell(
            child: ListTile(
              title: Text(
                'Services',
                style: Theme.of(context).textTheme.title,
              ),
              trailing: Icon(CupertinoIcons.right_chevron),
            ),
            onTap: () => {},
          ),
          InkWell(
            child: ListTile(
              title: Text(
                'FAQ',
                style: Theme.of(context).textTheme.title,
              ),
              trailing: Icon(CupertinoIcons.right_chevron),
            ),
            onTap: () => {},
          ),
          InkWell(
            child: ListTile(
              title: Text(
                'Terms and Conditions',
                style: Theme.of(context).textTheme.title,
              ),
              trailing: Icon(CupertinoIcons.right_chevron),
            ),
            onTap: () => {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Got any questions or feedback?',
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    bottom: titleTextSize,
                  ),
                  child: CupertinoButton(
                    minSize: smallButtonSize,
                    color: primaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: Text(
                      'Call us now',
                      style: Theme.of(context).accentTextTheme.caption,
                    ),
                    onPressed: () => {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
