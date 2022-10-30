import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

import '../Const/AppConst.dart';
import '../Const/CustomText.dart';
import '../Const/Dimension.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = "";

  resultTranslate() async {
    final translator_app = GoogleTranslator();
    // translator_app.translate(AppConst.userinput, from: AppConst.languageCode[AppConst.availableLang.indexOf(AppConst.dropdownFrom)], to: AppConst.languageCode[AppConst.availableLang.indexOf(AppConst.dropdownTo)]).then(print);
    var translation = await translator_app.translate(AppConst.userinput,
        to: AppConst
            .languageCode[AppConst.availableLang.indexOf(AppConst.dropdownTo)]);
    setState(() {
      result = translation.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: CustomText(
                txt: "Translator",
                txtSize: D.Hight30,
                clr: Colors.white,
                bold: false)),
        backgroundColor: const Color(0xFF35BDD0),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: D.Hight20, vertical: D.Hight20),
          child: ListView(
            children: [
              Row(
                children: [
                  CustomText(
                      txt: "From",
                      txtSize: D.Hight20,
                      clr: Colors.black,
                      bold: false),
                  SizedBox(
                    width: D.Hight10,
                  ),
                  Expanded(
                    child: Container(
                      height: D.Hight30 * 1.5,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          border: Border.all(color: Colors.purple),
                          borderRadius: BorderRadius.circular(D.Hight10)),
                      child: Center(
                        child: DropdownButton<String>(
                          value: AppConst.dropdownFrom,
                          icon: const Icon(Icons.arrow_drop_down_sharp),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontFamily: "Poppins",
                              fontSize: D.Hight20),
                          underline: Container(
                              height: 2, color: Colors.purple.shade50),
                          onChanged: (String? newValue) {
                            setState(() {
                              AppConst.dropdownFrom = newValue!;
                            });
                          },
                          items: AppConst.availableLang
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: D.Hight30,
              ),
              Row(
                children: [
                  CustomText(
                      txt: "To     ",
                      txtSize: D.Hight20,
                      clr: Colors.black,
                      bold: false),
                  SizedBox(
                    width: D.Hight10,
                  ),
                  Expanded(
                    child: Container(
                      height: D.Hight30 * 1.5,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          border: Border.all(color: Colors.purple),
                          borderRadius: BorderRadius.circular(D.Hight10)),
                      child: Center(
                        child: DropdownButton<String>(
                          value: AppConst.dropdownTo,
                          icon: Icon(Icons.arrow_drop_down_sharp),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontFamily: "Poppins",
                              fontSize: D.Hight20),
                          underline: Container(
                            height: 2,
                            color: Colors.purple.shade50,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              AppConst.dropdownTo = newValue!;
                            });
                          },
                          items: AppConst.availableLang
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: D.Hight30,
              ),
              TextField(
                maxLines: 5,
                onChanged: (val) {
                  setState(() {
                    AppConst.userinput = val;
                  });
                },
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    hintText: "Enter something",
                    hintStyle: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.blueGrey,
                        fontSize: D.Hight20),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple),
                        borderRadius:
                            BorderRadius.all(Radius.circular(D.Hight10)))),
              ),
              SizedBox(
                height: D.Hight30,
              ),
              MaterialButton(
                  minWidth: D.Hight100,
                  height: 50,
                  color: Color(0xFF35BDD0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(
                        color: Colors.purple,
                      )),
                  child: const Text('Translate',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () async {
                    Get.defaultDialog(barrierDismissible: false,
                        title: "Wait...",
                        titleStyle: TextStyle(
                            fontSize: D.Hight20,
                            fontFamily: "Poppins",
                            color: Colors.purple),
                        content: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.purple,
                            )));


                    await resultTranslate();

                    Navigator.pop(context);

                  }),
              SizedBox(
                height: D.Hight30,
              ),
              Container(
                height: D.Hight100 * 2,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(D.Hight10)),
                child: Padding(
                  padding: EdgeInsets.all(D.Hight10),
                  child: CustomText(
                      txt: result == "" ? " Your transalation" : "$result",
                      txtSize: D.Hight20,
                      clr: Colors.blueGrey,
                      bold: false),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
