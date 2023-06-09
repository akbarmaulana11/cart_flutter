import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDialog extends StatefulWidget {
  const ShowDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowDialog> createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController popUpController;

  @override
  void initState() {
    popUpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    popUpController.forward();
    super.initState();
  }

  @override
  void dispose() {
    popUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: ScaleTransition(
        scale: CurvedAnimation(
          parent: popUpController,
          curve: Curves.ease,
        ),
        child: Container(
          margin: const EdgeInsets.only(
            top: 12,
            right: 12,
            left: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    right: 8,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      popUpController.reverse();
                      Get.back();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/check.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Check Out Success',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade300),
                  onPressed: () {},
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: Center(
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
