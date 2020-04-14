import 'package:covid19_app/services/service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:covid19_app/model/summary.dart' ;

class CovidProvider extends ChangeNotifier {

  SummaryModel summary;
  bool order;

    CovidProvider(){
      loadData();
    }


    loadData() async {
     summary= await ServiceGeneral().getSummary();
     notify();
    }

    changeOrder(){
      order=order==null?true:order;
      order?summary.countries.sort((b, a) => a.totalConfirmed.compareTo(b.totalConfirmed)):summary.countries.sort((a, b) => a.totalConfirmed.compareTo(b.totalConfirmed));
      order =order?false:true;
      notify();

    }
    changeOrderName(){

      order=null;
      summary.countries.sort((a, b) => a.country.compareTo(b.country));

      notify();
    }



  notify() {
    notifyListeners();
  }

}