import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportsdb/components/country.dart';
import 'package:sportsdb/model.dart';

class CountryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(30),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ListView.separated(
          separatorBuilder: (_, __) => SizedBox(height: 20),
          itemBuilder: (BuildContext context, int index) {
            return FlatButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CountryScreen(countries[index].name)),
              ),
              color: Colors.white60,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    countries[index].name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(CupertinoIcons.arrow_right),
                ],
              ),
            );
          },
          itemCount: countries.length,
        ),
      ),
    );
  }
}
