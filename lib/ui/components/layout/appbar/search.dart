import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWithSearch extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithSearch({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(132.0);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
          // Background
          color: Theme.of(context).colorScheme.primary,
          height: 150.0,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text("Home",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),

        Container(), // Required for App Bar elevation

        Positioned(
          // Take AppBar size only
          top: 100.0,
          left: 16.0,
          right: 16.0,
          child: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const FaIcon(FontAwesomeIcons.bars,
                size: 18.0,
              ),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () {

              },
            ),
            primary: false,
            title: const TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: FaIcon(FontAwesomeIcons.magnifyingGlass,
                  size: 18.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {

                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.bell,
                  size: 20.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {

                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
