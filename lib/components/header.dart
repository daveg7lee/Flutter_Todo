import 'package:flutter/material.dart';
import 'package:flutter_todo/constant.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  var year = DateFormat.y().format(DateTime.now());
  var month = DateFormat.MMM().format(DateTime.now());
  var day = DateFormat.EEEE().format(DateTime.now());
  var date = DateFormat.d().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding / 1.5),
      child: Row(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding / 4),
                child: Text(
                  date,
                  style: const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    month.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    year.toString(),
                    style: const TextStyle(fontSize: 18),
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            day.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
      ),
    );
  }
}
