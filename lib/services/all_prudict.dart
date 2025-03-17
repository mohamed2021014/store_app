import 'package:ecommerce_app/core/constant/link_services.dart';
import 'package:ecommerce_app/helper/api.dart';

import 'package:ecommerce_app/model/get_all_prudict.dart';

class Servises {
  List<PrudctModel> prudictList = [];
  Future<List<PrudctModel>> getAllPrudict() async {
    List<dynamic> prucdict = await ApiMethod().get(url: LinkServices.view);
    for (var i in prucdict) {
      prudictList.add(PrudctModel.fromjson(i));
    }
    return prudictList;
  }
}
