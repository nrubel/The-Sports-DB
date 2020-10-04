import 'package:flutter/material.dart';
import 'package:sportsdb/components/item_utils.dart';
import 'package:sportsdb/components/social.dart';
import 'package:sportsdb/model.dart';

class LeagueItem extends StatelessWidget {
  final League league;

  LeagueItem({this.league});

  @override
  Widget build(BuildContext context) {
    return leagueItemWrapper(
      background: league.strBanner,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            league.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              shadows: <Shadow>[
                Shadow(blurRadius: 10.0, color: Colors.black45)
              ],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              league.strLogo != null
                  ? SizedBox(
                      child: Image.network(league.strLogo),
                      width: 80,
                    )
                  : SizedBox.shrink()
            ],
          ),
          Social(facebook: league.facebook, twitter: league.twitter),
        ],
      ),
    );
  }
}
