import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/res/custom_text_field.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/view_model/controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  final TextEditingController aadhaarNumberCon = TextEditingController();
  final TextEditingController aadhaarNameCon = TextEditingController();
  final TextEditingController panNameCon = TextEditingController();
  final TextEditingController panNoCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final selectImage = Provider.of<ElementController>(
      context,
    );
    return Scaffold(
      backgroundColor: GameColor.black,
      appBar: ConstantAppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: GameColor.white,
            )),
        title: const Text(
          "KYC",
          style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "Fill details for KYC verification.",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: GameColor.white,
                  fontSize: 18),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "Enter your Aadhar Name* ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: GameColor.white,
                  fontSize: 16),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
              controller: aadhaarNameCon,
              contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
              label: "Aadhaar name",
              hintColor: GameColor.black,
              hintSize: 14,
              // width: width >= 450 ? width * 0.5 : width * 0.65,
              height: 50,
              maxLength: 12,
              filled: true,
              fillColor: GameColor.white,
              border: Border.all(color: GameColor.white),
              borderRadius: BorderRadius.circular(11),
              fieldRadius: BorderRadius.circular(10),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "Enter your Aadhar Number* ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: GameColor.white,
                  fontSize: 16),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
              controller: aadhaarNumberCon,
              keyboardType: TextInputType.number,
              contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
              label: "Aadhaar number",
              hintColor: GameColor.black,
              hintSize: 14,
              // width: width >= 450 ? width * 0.5 : width * 0.65,
              height: 50,
              maxLength: 12,
              filled: true,
              fillColor: GameColor.white,
              border: Border.all(color: GameColor.white),
              borderRadius: BorderRadius.circular(11),
              fieldRadius: BorderRadius.circular(10),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "Enter your PAN Name* ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: GameColor.white,
                  fontSize: 16),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
              controller: panNameCon,
              contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
              label: "PAN name",
              hintColor: GameColor.black,
              hintSize: 14,
              // width: width >= 450 ? width * 0.5 : width * 0.65,
              height: 50,
              filled: true,
              fillColor: GameColor.white,
              border: Border.all(color: GameColor.white),
              borderRadius: BorderRadius.circular(11),
              fieldRadius: BorderRadius.circular(10),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "Enter your PAN Number* ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: GameColor.white,
                  fontSize: 16),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomTextField(
              controller: panNoCon,
              contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
              label: "PAN Number",
              hintColor: GameColor.black,
              hintSize: 14,
              // width: width >= 450 ? width * 0.5 : width * 0.65,
              height: 50,
              maxLength: 10,
              filled: true,
              fillColor: GameColor.white,
              border: Border.all(color: GameColor.white),
              borderRadius: BorderRadius.circular(11),
              fieldRadius: BorderRadius.circular(10),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.13,
                    width: width * 0.45,
                    child: selectImage.aadhaarImage != null
                        ? Image.file(
                            selectImage.aadhaarImage!,
                            fit: BoxFit.fill,
                          )
                        : Container(),
                  ),
                  ConstantButton(
                    width: width * 0.45,
                    onTap: () {
                      selectImage.getAadhaarImage(ImageSource.gallery);
                      // _showPicker(context);
                    },
                    text: 'Upload Aadhaar Image',
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: height * 0.13,
                    width: width * 0.45,
                    child: selectImage.panImage != null
                        ? Image.file(
                            selectImage.panImage!,
                            fit: BoxFit.fill,
                          )
                        : Container(),
                  ),
                  ConstantButton(
                    width: width * 0.45,
                    onTap: () {
                      selectImage.getPanImage(ImageSource.gallery);
                      // _showPicker(context);
                    },
                    text: 'Upload PAN Image',
                  ),
                ],
              )
            ]),
            SizedBox(
              height: height * 0.05,
            ),
            Center(
              child: ConstantButton(
                width: width * 0.45,
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.bottomNavBar,
                      arguments: {"index": 0});
                  // _showPicker(context);
                },
                text: 'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }


}
