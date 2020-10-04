import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sportsdb/api.dart';
import 'package:sportsdb/components/league_item.dart';
import 'package:sportsdb/model.dart';

class CountryScreen extends StatefulWidget {
  final String name;

  CountryScreen(this.name);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<CountryScreen> {
  String _url;
  List<League> _leagues = [];

  @override
  void initState() {
    _url = Endpoints.listByCountry + widget.name;
    super.initState();
    _getLeagues();
  }

  void _getLeagues([String str = '']) async {
    try {
      final Response response =
          await Dio().get(str.isEmpty ? _url : _url + '&s=' + str);
      List<League> _list = [];
      response.data['countrys']?.forEach((e) => _list.add(League.fromJson(e)));
      if (_list.isNotEmpty) setState(() => _leagues = _list);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: false,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  onChanged: (String value) => Timer(
                    const Duration(milliseconds: 500),
                    () => _getLeagues(value),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search leagues...',
                    border: InputBorder.none,
                    fillColor: Colors.black12,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: _leagues.length == 0
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        itemBuilder: (BuildContext ctx, int index) {
                          League _league = _leagues[index];
                          return LeagueItem(league: _league);
                        },
                        separatorBuilder: (_, __) => SizedBox(height: 20),
                        itemCount: _leagues.length,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
