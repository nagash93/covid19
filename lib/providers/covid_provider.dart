import 'package:covid19_app/services/service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:covid19_app/model/summary.dart' ;

class CovidProvider extends ChangeNotifier {

  SummaryModel summary;

    CovidProvider(){
      loadData();
    }


    loadData() async {
     summary= await ServiceGeneral().getSummary();
     notify();
    }



  notify() {
    notifyListeners();
  }

}