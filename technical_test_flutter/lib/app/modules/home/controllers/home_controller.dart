import 'package:get/get.dart';
import 'package:technical_test_flutter/app/modules/home/models/home_model.dart';
import 'package:technical_test_flutter/app/modules/home/service/home_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  //data
  var getData = <ObjHomeData>[].obs;
  var temp = <ObjHomeData>[].obs;
  var cartCount = 0.obs;

  late RxList<RxInt> qtyBuy;
  late RxList<RxInt> tempQty;
  @override
  void onInit() {
    print('init');
    getAllData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void increment(bool? status, int i) {
  //   if (status == true) {
  //     qtyBuy.value++;
  //   } else {
  //     cartCount.value--;
  //   }
  // }

  Future getAllData() async {
    try {
      await HomeService.getData().then((value) {
        if (value is HomeAllData) {
          print(value);
          getData.value = value.data!;
          qtyBuy = List.generate(getData.length, (index) => 0.obs).obs;
          tempQty = List.generate(getData.length, (index) => 0.obs).obs;
          print('LENGHT : ${qtyBuy.length}');
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
