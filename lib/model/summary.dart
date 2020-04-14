import 'dart:convert';

import 'package:covid19_app/model/country.dart';
import 'package:covid19_app/model/global.dart';

SummaryModel summaryModelFromJson(String str) => SummaryModel.fromJson(json.decode(str));

String summaryModelToJson(SummaryModel data) => json.encode(data.toJson());

class SummaryModel {
  Global global;
  List<Country> countries;
  DateTime date;

  SummaryModel({
    this.global,
    this.countries,
    this.date,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) => SummaryModel(
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
