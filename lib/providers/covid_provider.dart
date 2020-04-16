import 'package:covid19_app/services/service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:covid19_app/model/summary.dart';

class CovidProvider extends ChangeNotifier {
  SummaryModel _summary;
  bool _order;
  bool _loading=false;
  bool _error=false;

  SummaryModel get summary => _summary;
  bool get order => _order;
  bool get loading => _loading;
  bool get error =>_error;

  CovidProvider() {
    loadData();
  }

  loadData() async {
    _loading=true;
    _error = false;
    notify();
    await ServiceGeneral().getSummary().then((value){
      if(value!=null){
        _summary=value;
      }else{
        _error = true;
      }
      _loading=false;
    }).catchError((error){
      _loading=false;
      _error = true;

    });
    notify();
  }

  changeOrder() {
    _order = _order == null ? true : _order;
    _order
        ? _summary.countries
            .sort((b, a) => a.totalConfirmed.compareTo(b.totalConfirmed))
        : summary.countries
            .sort((a, b) => a.totalConfirmed.compareTo(b.totalConfirmed));
    _order = _order ? false : true;
    notify();
  }

  changeOrderName() {
    _order = null;
    _summary.countries.sort((a, b) => a.country.compareTo(b.country));

    notify();
  }

  notify() {
    notifyListeners();
  }
}
