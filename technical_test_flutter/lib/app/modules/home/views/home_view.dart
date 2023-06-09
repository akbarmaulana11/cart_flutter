import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:technical_test_flutter/app/modules/home/views/cart.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text(
                  'Cigar',
                  style: TextStyle(color: Colors.red.shade500),
                ),
                Text(
                  'Mobile',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            actions: [
              Container(
                margin: EdgeInsets.only(right: 20, top: 12),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        //
                        Get.to(() => const Cart());
                      },
                      child: Icon(
                        Icons.trolley,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 20,
                        width: 20,
                        // constraints: BoxConstraints(maxWidth: 20),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                            child: Text(
                          '${controller.cartCount.value}',
                          style: TextStyle(fontSize: 12),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Get.width * 0.05,
                  childAspectRatio: 0.8,
                ),
                padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                itemCount: controller.getData.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 70,
                                  child: Image.network(
                                      'https://recruitment.pt-bks.com/assets/Rokok%201.png'),
                                ),
                                SizedBox(height: 16),
                                SizedBox(
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (controller.qtyBuy[index].value !=
                                              0) {
                                            controller.qtyBuy[index].value--;
                                            controller.tempQty[index].value++;
                                          }
                                          controller.temp.remove(
                                              controller.getData[index]);
                                        },
                                        child: Container(
                                          color: Colors.red.shade300,
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Text('${controller.qtyBuy[index].value}'),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          if (controller.getData[index].qty !=
                                              controller.qtyBuy[index].value) {
                                            controller.qtyBuy[index].value++;
                                            controller.tempQty[index].value =
                                                controller.getData[index].qty! -
                                                    controller
                                                        .qtyBuy[index].value;
                                          }
                                          controller.temp
                                              .add(controller.getData[index]);
                                          print(controller.getData[index].name);
                                        },
                                        child: Container(
                                          color: Colors.red.shade300,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  controller.getData[index].name!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Qty : ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      controller.tempQty[index].value == 0
                                          ? '${controller.getData[index].qty}'
                                          : '${controller.tempQty[index].value}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: Get.width / 1.2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade300),
                          onPressed: () {
                            //
                            controller.cartCount.value = controller.temp.length;
                          },
                          child: Text('Tambah data'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
