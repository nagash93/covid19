import 'package:covid19_app/config.dart';
import 'package:covid19_app/model/summary.dart';
import 'package:http/http.dart' as http;

class ServiceGeneral {
  Future<SummaryModel> getSummary() async {
    var res = await http.get('${Config().urlService}summary');
    if (res.statusCode == 200) {
      SummaryModel resp = summaryModelFromJson(res.body);
      return resp;
    } else {
      return null;
    }
  }
}
