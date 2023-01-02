// Import Flutter Dependencies
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

class ExpenseEdit extends StatefulWidget {
  final double? initialValue;
  final String? initialDescription;
  final IconData? floatingActionButtonIcon;
  final void Function()? onFloatingActionButtonPressed;
  final void Function({
    required double value,
    required String? description,
  }) onSubmit;

  const ExpenseEdit({
    this.initialValue,
    this.initialDescription,
    super.key,
    this.floatingActionButtonIcon,
    this.onFloatingActionButtonPressed,
    required this.onSubmit,
  });

  @override
  State<ExpenseEdit> createState() => _ExpenseEditState();
}

class _ExpenseEditState extends State<ExpenseEdit> {
  // Text Controllers
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  // This helps to keep the text more readable when the user taps down
  bool isTappedDown = false;

  @override
  void initState() {
    super.initState();

    priceController.text = widget.initialValue?.toStringAsFixed(2) ?? '';
    descriptionController.text = widget.initialDescription?.toString() ?? '';
  }

  void onSubmit() async {
    final value = double.tryParse(priceController.text.trim()) ?? 0.0;
    final description = descriptionController.text.trim();

    if (value == 0) {
      Get.snackbar(
          "Nope!", "You can't create an expense with an amout of zero.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade100);
      return;
    }

    // // Starts the vibration
    // if (await Vibration.hasVibrator() ?? false) {
    //   Vibration.vibrate(duration: 50);
    // }

    widget.onSubmit(
      value: value,
      description: description.isEmpty ? null : description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: InkWell(
        onLongPress: onSubmit,
        onHighlightChanged: (value) {
          setState(() {
            isTappedDown = value;
          });
        },
        highlightColor: Colors.green.shade400,
        focusColor: Colors.transparent,
        splashColor: Colors.green.shade100,
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Dollar Sign
                Text(
                  "€",
                  style: TextStyle(
                    fontSize: 50,
                    color: isTappedDown ? Colors.white : Colors.green.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 20),
                IntrinsicWidth(
                  child: TextField(
                    controller: priceController,
                    maxLength: 8,
                    style: TextStyle(
                      fontSize: 50,
                      color:
                          isTappedDown ? Colors.white : Colors.green.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: "0.00",
                      hintStyle: TextStyle(
                        fontSize: 50,
                        color: Colors.green.shade200,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            // Input Description
            TextField(
              controller: descriptionController,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: isTappedDown ? Colors.white : Colors.green.shade700,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: "Description (optional)",
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.green.shade200,
                ),
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 32),
            Text(
              "Tap and hold to submit",
              style: TextStyle(
                color: Colors.green.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: widget.floatingActionButtonIcon == null
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.green.shade200,
              foregroundColor: Colors.green.shade900,
              onPressed: widget.onFloatingActionButtonPressed,
              child: Icon(widget.floatingActionButtonIcon),
            ),
    );
  }
}
