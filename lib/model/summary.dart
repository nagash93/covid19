import 'dart:convert';

import 'package:covid19_app/model/Country.dart';
import 'package:covid19_app/model/global.dart';

Summary summaryFromJson(String str) => Summary.fromJson(json.decode(str));

String summaryToJson(Summary data) => json.encode(data.toJson());

class Summary {
  Global global;
  List<Country> countries;
  DateTime date;

  Summary({
    this.global,
    this.countries,
    this.date,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    global: Global.fromJson(json["Global"]),
    countries: List<Country>.from(json["Countries"].map((x) => Country.fromJson(x))),
    date: DateTime.parse(json["Date"]),
  );

  Map<String, dynamic> toJson() => {
    "Global": global.toJson(),
    "Countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "Date": date.toIso8601String(),
  };
}