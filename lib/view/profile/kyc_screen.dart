import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/res/custom_text_field.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/add_bank_details_view_model.dart';
import 'package:future_trade/view_model/add_kyc_view_model.dart';
import 'package:future_trade/view_model/controller.dart';
import 'package:future_trade/view_model/user_view_model.dart';
import 'package:future_trade/view_model/view_kyc_details_view_model.dart';
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
  void initState() {
    Provider.of<ViewKycDetailViewModel>(context, listen: false).viewKycDetailsApi(context);
    super.initState();
    kycDetail();
  }
  kycDetail() {
    final kycDetails =
        Provider.of<ViewKycDetailViewModel>(context, listen: false).kycResponse;
    aadhaarNameCon.text =
    kycDetails == null ? '' : kycDetails.data!.aadhaarName.toString();
    aadhaarNumberCon.text =
    kycDetails == null ? '' : kycDetails.data!.aadhaarNumber.toString();
    panNameCon.text =
    kycDetails == null ? '' : kycDetails.data!.panName.toString();
    panNoCon.text =
    kycDetails == null ? '' : kycDetails.data!.panNumber.toString();
    // ifscCont.text =
    // kycDetails == null ? '' : kycDetails.data!.ifscCode.toString();
  }
  @override
  Widget build(BuildContext context) {
    final selectImage = Provider.of<ElementController>(
      context,
    );
    final addKyc = Provider.of<AddKycViewModel>(
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
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.12,
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
                    text: 'Upload Aadhaar Front Image',
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: height * 0.12,
                    width: width * 0.45,
                    child: selectImage.aadhaarBackImage != null
                        ? Image.file(
                      selectImage.aadhaarBackImage!,
                      fit: BoxFit.fill,
                    )
                        : Container(),
                  ),
                  ConstantButton(
                    width: width * 0.45,
                    onTap: () {
                      selectImage.getAadhaarBackImage(ImageSource.gallery);
                      // _showPicker(context);
                    },
                    text: 'Upload Aadhaar Back Image',
                  ),
                ],
              )
            ]),
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
              height: height * 0.02,
            ),

            SizedBox(
              height: height * 0.12,
              width: width * 0.45,
              child: selectImage.panImage != null
                  ? Image.file(
                selectImage.panImage!,
                fit: BoxFit.fill,
              )
                  : Container(),
            ),
            Row(
              children: [
                ConstantButton(
                  width: width * 0.45,
                  onTap: () {
                    selectImage.getPanImage(ImageSource.gallery);
                    // _showPicker(context);
                  },
                  text: 'Upload PAN Image',
                ),
                Center(
                  child: ConstantButton(
                    width: width * 0.45,
                    onTap: () async{
                      if (aadhaarNameCon.text.isEmpty) {
                        Utils.flushBarErrorMessage("Please enter Aadhaar name", context);
                      } else if (aadhaarNumberCon.text.isEmpty || aadhaarNumberCon.text.length <12) {
                        Utils.flushBarErrorMessage("Please enter Aadhaar no.", context);
                      }else if (panNameCon.text.isEmpty ) {
                        Utils.flushBarErrorMessage("Please enter PAN name.", context);
                      }
                      else if (panNoCon.text.isEmpty || panNoCon.text.length <10) {
                        Utils.flushBarErrorMessage("Please enter PAN No.",context);
                      }else if (selectImage.aadhaarImage == null ) {
                        Utils.flushBarErrorMessage("Please  upload Aadhaar front image.",context);
                      }
                      else if (selectImage.aadhaarBackImage == null ) {
                        Utils.flushBarErrorMessage("Please upload Aadhaar back image.",context);
                      }
                      else if (selectImage.panImage == null ) {
                        Utils.flushBarErrorMessage("Please upload PAN image.",context);
                      }else {
                        UserViewModel userViewModel = UserViewModel();
                        String? userId = await userViewModel.getUser();
                        Map data = {
                          "user_id": userId,
                          "aadhaarName": aadhaarNameCon.text,
                          "aadhaarNumber": aadhaarNumberCon.text,
                          "panName": panNameCon.text,
                          "panNumber": panNoCon.text,
                          "aadhaarImg": selectImage.aadhaarBase64Image,
                          "panImg": selectImage.aadhaarBase64Image
                        };
                        addKyc.addKycApi(data, context);
                      }
                      },
                    text: 'Submit',
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }


}
