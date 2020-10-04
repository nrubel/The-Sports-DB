import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Social extends StatelessWidget {
  Social({this.facebook, this.twitter});

  final String facebook;
  final String twitter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _iconButton(facebook, 'facebook'),
        SizedBox(width: 15),
        _iconButton(twitter, 'twitter'),
      ],
    );
  }

  Widget _iconButton(String url, String asset) => url.isEmpty
      ? SizedBox.shrink()
      : InkWell(
          onTap: () async {
            if (await canLaunch('https://' + url)) {
              await launch('https://' + url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: SvgPicture.asset(
            'assets/$asset.svg',
            width: 25,
            color: Colors.white,
          ),
        );
}
