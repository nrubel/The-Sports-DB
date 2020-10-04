import 'package:flutter/material.dart';

Container leagueItemWrapper({Widget child, String background}) => Container(
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: NetworkImage(
            background ?? "http://via.placeholder.com/350x150/f5f5f5/f5f5f5",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: RadialGradient(
            radius: 0.98,
            colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
          ),
        ),
        child: child,
      ),
    );
