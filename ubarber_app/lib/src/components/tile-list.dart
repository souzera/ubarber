import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ubarber_app/src/pages/base/__________profile.dart';

class ListTiles extends StatelessWidget {
  final List<InfoMockup> items;

  const ListTiles({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return _build();
  }

  Widget _build() => Container(
      width: 315,
      height: 500,
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: ((context, index) {
            final item = items[index];
            return Container(
              height:70,
              width: 200,
              margin: EdgeInsets.only(bottom: 3),
              child: ListTile(
                title: item.buildTitle(context),
                subtitle: item.buildSubtitle(context),
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TelaProfile(ctx: 1)))
                },
                tileColor: Colors.transparent,
              ),
          );
        })),
      );
}

abstract class InfoMockup {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class InfoBTN implements InfoMockup {
  final String title;
  final String subtitle;

  InfoBTN(this.title, this.subtitle);

  @override
  Widget buildTitle(BuildContext context) => Text(title);
  @override
  Widget buildSubtitle(BuildContext context) => Text(subtitle);
}
