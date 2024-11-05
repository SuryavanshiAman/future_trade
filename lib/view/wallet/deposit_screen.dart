import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/circular_button.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/res/custom_container.dart';
import 'package:future_trade/res/custom_text_field.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/controller.dart';
import 'package:future_trade/view_model/deposit_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final TextEditingController amountCon = TextEditingController();
  int _currentAmount = 0;
  void _updateAmount(int amount) {
    setState(() {
      _currentAmount += amount;
      amountCon.text = _currentAmount.toString();
    });
  }

  String _selectedOption = "1";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectImage = Provider.of<ElementController>(context);
    final depositViewModel = Provider.of<DepositViewModel>(context);
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
          "Deposit",
          style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                margin: const EdgeInsets.all(10),
                height: height * 0.3,
                width: width * 0.9,
                decoration: const BoxDecoration(
                    color: GameColor.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter Amount",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextField(
                      controller: amountCon,
                      keyboardType: TextInputType.number,
                      label: "Enter amount here",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: GameColor.white),
                      hintColor: GameColor.white,
                      height: 70,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      filled: true,
                      fillColor: GameColor.blue.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(25),
                      fieldRadius: BorderRadius.circular(25),
                      prefix: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Text(
                          "₹",
                          style: TextStyle(
                              color: GameColor.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const Spacer(),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 40,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4),
                        itemCount: 6,
                        itemBuilder: (BuildContext ctx, index) {
                          return _buildAmountContainer(selectImage.amount[index]) ;
                        })
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Get cashback on deposit above ₹100",
                  style: TextStyle(fontSize: 16, color: GameColor.white),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: selectImage.paymentOptions.length,
                itemBuilder: (context, index) {
                  final option = selectImage.paymentOptions[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: GameColor.white,
                      backgroundImage: AssetImage(option['image'].toString()),
                    ),
                    title: Text(
                      option['title'],
                      style: const TextStyle(color: GameColor.white),
                    ),
                    subtitle: Text(
                      option['subtitle'],
                      style: const TextStyle(fontSize: 10, color: GameColor.white),
                    ),
                    trailing: Radio<String>(
                      value: option['value'],
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value!;
                          if (_selectedOption == 'Cheque') {
                            _showPicker(context);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
              Center(
                child: SizedBox(

                  height: height * 0.1,
                  width: width * 0.5,
                  child: selectImage.image != null
                      ? Image.file(
                          selectImage.image!,
                          fit: BoxFit.fill,
                        )
                      :  Container(),
                ),
              ),
            ],
          ),
      bottomNavigationBar:
      depositViewModel.loading==false?
      CustomContainer(
        margin: const EdgeInsets.all(10),
        onTap: () {
          if (amountCon.text.isEmpty) {
            Utils.flushBarErrorMessage("Please Enter the Amount", context);
          } else if (int.parse(amountCon.text) < 100) {
            Utils.flushBarErrorMessage(
                "Please Enter the Amount at least ₹100", context);
          } else if (_selectedOption=="1") {
            Utils.flushBarErrorMessage(
                "Please select payment type", context);

          }else{
            depositViewModel.depositApi(amountCon.text,_selectedOption=="1"?"":_selectedOption,selectImage.base64Image ?? "", context);
          }
        },
        alignment: Alignment.center,
        height: height * 0.07,
        widths: width * 0.8,
        color: GameColor.green,
        borderRadius: const BorderRadius.all(Radius.circular(35)),
        child: const Text(
          "Add Money",
          style: TextStyle(
              color: GameColor.white, fontWeight: FontWeight.w500),
        ),
      )
          :const CircularButton() ,
    );
  }

  Widget _buildAmountContainer(int amount) {
    return GestureDetector(
      onTap: () => _updateAmount(amount),
      child: Container(
        width: width * 0.26,
        height: height * 0.055,
        decoration: BoxDecoration(
            border: Border.all(color: GameColor.black),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        // color: Colors.blue,
        child: Center(
          child: Text(
            '+ ₹$amount',
            style: TextStyle(color: GameColor.black, fontSize: 18),
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    final selectImage = Provider.of<ElementController>(context, listen: false);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  selectImage.getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  selectImage.getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
