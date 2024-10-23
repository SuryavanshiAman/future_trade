import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/res/custom_container.dart';
import 'package:future_trade/res/custom_text_field.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/controller.dart';
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
    final selectImage=Provider.of<ElementController>(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(18),
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
                        // borderRadius: ,
                        filled: true,
                        // borderSide: BorderSide(color: GameColor.blue),
                        // borderSideFocus: BorderSide(color: GameColor.blue),
                        fillColor: GameColor.purple.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(25),
                        fieldRadius:  BorderRadius.circular(25),
                        // fieldRadius: const BorderRadius.only(
                        //     topRight: Radius.circular(10),
                        //     topLeft: Radius.circular(10)),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildAmountContainer(10000),
                          _buildAmountContainer(25000),
                          _buildAmountContainer(50000),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildAmountContainer(100000),
                          _buildAmountContainer(200000),
                          _buildAmountContainer(500000),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Get cashback on deposit above ₹100",
                  style: TextStyle(fontSize: 16, color: GameColor.white),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: GameColor.white,
                  backgroundImage: AssetImage("assets/images/cash.png"),
                ),
                // const Icon(Icons.visibility),
                title: const Text(
                  'Cash',
                  style: TextStyle(color: GameColor.white),
                ),
                subtitle: const Text(
                  'Use Cash for payment',
                  style: TextStyle(fontSize: 10, color: GameColor.white),
                ),
                trailing: Radio<String>(
                  value: 'Cash',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: GameColor.white,
                  backgroundImage: AssetImage("assets/images/cheque.png"),
                ),
                title: const Text(
                  'Cheque',
                  style: TextStyle(color: GameColor.white),
                ),
                subtitle: const Text(
                  'Upload Cheque for payment',
                  style: TextStyle(fontSize: 10, color: GameColor.white),
                ),
                trailing: Radio<String>(
                  value: 'Cheque',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                      _showPicker(context);
                    });
                  },
                ),
              ),
              ListTile(
                leading: const CircleAvatar(

                  backgroundColor: GameColor.white,
                  backgroundImage: AssetImage("assets/images/upi.png",)
                ),
                title: const Text(
                  'UPI',
                  style: TextStyle(color: GameColor.white),
                ),
                subtitle: const Text(
                  'Use UPI for payment',
                  style: TextStyle(fontSize: 10, color: GameColor.white),
                ),
                trailing: Radio<String>(
                  value: 'UPI',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: GameColor.white,
                  backgroundImage: AssetImage("assets/images/banking.png"),
                ),
                title: const Text(
                  'Debit/NetBanking',
                  style: TextStyle(color: GameColor.white),
                ),
                subtitle: const Text(
                  'Use Debit card or use NetBanking for payment',
                  style: TextStyle(fontSize: 10, color: GameColor.white),
                ),
                trailing: Radio<String>(
                  value: 'Debit/NetBanking',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
              ),
              Center(
                child: SizedBox(
                  height: height*0.1,width: width*0.5,
                child:  selectImage.image!=null?Image.file( selectImage.image!,fit: BoxFit.fill,):Text("No image selected"),
                ),
              ),

            ],
          ),
          CustomContainer(
            margin: EdgeInsets.all(10),
            onTap: () {
              if (amountCon.text.isEmpty) {
                Utils.show(
                  "Please Enter the Amount",
                  color: GameColor.gameRed,
                  context,
                );
              } else if (int.parse(amountCon.text) < 100) {
                Utils.show(
                  "Please Enter the Amount at least ₹100",
                  color: GameColor.gameRed,
                  context,
                );
              } else {
                Utils.show(
                  "Amount deposited successfully",
                  color: GameColor.lightGreen,
                  context,
                );
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
          ),
          // Text(
          //   "100% Secure Payments",
          //   style: TextStyle(color: GameColor.gray),
          // )
        ],
      ),
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
    final selectImage=Provider.of<ElementController>(context,listen: false);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  selectImage.getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
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
