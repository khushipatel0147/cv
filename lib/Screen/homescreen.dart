import 'dart:io';

import 'package:cv/class/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  bool isPerson = false;
  String? selectEdu;
  String? selectExp;
  String? selectmo;
  String? selectfiled;
  bool lan1 = false;
  bool lan2 = false;
  bool lan3 = false;
  bool lan4 = false;
  List moList = ["12000", "10000", "8000", "5000"];
  List expList = ["1 Year", "2 Year", "3 Year", "4 Year"];
  List eduList = ["B.com", "B.B.A", "B.C.A", "M.C.A", "M.Com", "M.B.A"];
  List lanList = ["Gujrati", "English", "Hindi", "Other"];
  List popList = ["Setting", "Help", "Search"];
  bool onf = false;
  RangeValues rangeValues = RangeValues(10000, 25000);
  TextEditingController txtfname = TextEditingController();
  TextEditingController txtlname = TextEditingController();
  TextEditingController txtcont = TextEditingController();
  TextEditingController txtem = TextEditingController();
  TextEditingController txtadd = TextEditingController();

  var txtkey = GlobalKey<FormState>();
  String? path;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: WillPopScope(
        onWillPop: back,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            centerTitle: true,
            title: Text(
              "CV Creator",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Setting"),
                          onTap: () {},
                        ),
                        PopupMenuItem(
                          child: Text("Help"),
                          onTap: () {},
                        ),
                        PopupMenuItem(
                          child: Text("Search"),
                          onTap: () {},
                        ),
                      ])
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                path==null ?Image.asset("assets/images/user.png",
                    height: 120, width: 120, color: Colors.black26)
                :CircleAvatar(backgroundImage: FileImage(File("$path")),radius: 80,),
                SizedBox(height: 15),
                Row(
                  children: [
                    Spacer(),
                    ElevatedButton(
                      onPressed: ()
                      async {
                        ImagePicker imagepicker = ImagePicker();
                        XFile? xFile =await imagepicker.pickImage(source: ImageSource.camera);
                        setState(() {
                          path=xFile?.path;
                        });
                      },
                      child: Text(
                        "Camera",
                        style: TextStyle(
                            color: Colors.teal,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade100),
                    ),
                    SizedBox(width: 15),
                    ElevatedButton(
                      onPressed: ()  async {
                        ImagePicker imagepicker = ImagePicker();
                        XFile? xFile =await imagepicker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          path=xFile?.path;
                        });
                      },
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                            color: Colors.teal,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade100),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 15),
                ExpansionTile(
                  collapsedBackgroundColor: Colors.teal.shade100,
                  collapsedIconColor: Colors.teal,
                  title: Text(
                    "Personal Information",
                    style: TextStyle(
                        color: Colors.teal, fontSize: 15, letterSpacing: 1),
                  ),
                  leading: Icon(Icons.person, color: Colors.teal),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: txtfname,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter the Information";
                              }
                              return null;
                            },
                            cursorColor: Colors.teal.shade200,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade200)),
                                label: Text(
                                  "First Name",
                                  style: TextStyle(color: Colors.teal.shade200),
                                ),
                                fillColor: Colors.teal.shade200,
                                focusColor: Colors.teal.shade200,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade300))),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: txtlname,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter the Information";
                              }
                              return null;
                            },
                            cursorColor: Colors.teal.shade200,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade200)),
                                label: Text(
                                  "Last Name",
                                  style: TextStyle(color: Colors.teal.shade200),
                                ),
                                fillColor: Colors.teal.shade200,
                                focusColor: Colors.teal.shade200,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade300))),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: txtadd,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter the Information";
                              }
                              return null;
                            },
                            cursorColor: Colors.teal.shade200,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade200)),
                                label: Text(
                                  "Address",
                                  style: TextStyle(color: Colors.teal.shade200),
                                ),
                                fillColor: Colors.teal.shade200,
                                focusColor: Colors.teal.shade200,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade300))),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: txtcont,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter the Information";
                              } else if (value.length != 10) {
                                return "Enter the Valid Number";
                              }
                              return null;
                            },
                            cursorColor: Colors.teal.shade200,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade200)),
                                label: Text(
                                  "Contact",
                                  style: TextStyle(color: Colors.teal.shade200),
                                ),
                                fillColor: Colors.teal.shade200,
                                focusColor: Colors.teal.shade200,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade300))),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: txtem,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter the Information";
                              }
                              return null;
                            },
                            cursorColor: Colors.teal.shade200,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade200)),
                                label: Text(
                                  "Email",
                                  style: TextStyle(color: Colors.teal.shade200),
                                ),
                                fillColor: Colors.teal.shade200,
                                focusColor: Colors.teal.shade200,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade300))),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (txtkey.currentState!.validate()) {
                              }
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal.shade100),
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Text(
                                "Gender Selection",
                                style: TextStyle(
                                    color: Colors.teal, letterSpacing: 1),
                              ),
                              SizedBox(height: 5),
                              RadioListTile(
                                activeColor: Colors.teal,
                                value: "Male",
                                groupValue: selectfiled,
                                onChanged: (value) {
                                  setState(() {
                                    selectfiled = value;
                                  });
                                },
                                title: Text("Male"),
                              ),
                              SizedBox(height: 5),
                              RadioListTile(
                                activeColor: Colors.teal,
                                value: "Female",
                                groupValue: selectfiled,
                                onChanged: (value) {
                                  setState(() {
                                    selectfiled = value;
                                  });
                                },
                                title: Text("Female"),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ExpansionTile(
                  collapsedBackgroundColor: Colors.teal.shade100,
                  collapsedIconColor: Colors.teal,
                  title: Text(
                    "Education Information",
                    style: TextStyle(
                        color: Colors.teal, fontSize: 15, letterSpacing: 1),
                  ),
                  leading: Icon(Icons.menu_book, color: Colors.teal),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                          alignment: Alignment.center,
                          isExpanded: true,
                          items: eduList
                              .map((e) => DropdownMenuItem(
                                    child: Text("$e"),
                                    value: e,
                                  ))
                              .toList(),
                          focusColor: Colors.teal.shade50,
                          hint: Text("Selecte Education"),
                          value: selectEdu,
                          onChanged: (value) {
                            setState(() {
                              selectEdu = value as String;
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ListTile(
                    tileColor: Colors.teal.shade100,
                    title: Text(
                      "Language Information",
                      style: TextStyle(
                          color: Colors.teal, fontSize: 15, letterSpacing: 1),
                    ),
                    leading: Icon(Icons.language, color: Colors.teal),
                    trailing: Switch(
                      value: onf,
                      onChanged: (value) {
                        setState(() {
                          onf = value;
                        });
                      },
                      activeColor: Colors.teal,
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Visibility(
                    visible: onf,
                    child: Column(
                      children: [
                        CheckboxListTile(
                          value: lan1,
                          activeColor: Colors.teal.shade200,
                          onChanged: (value) {
                            setState(() {
                              lan1 = value!;
                            });
                          },
                          title: Text("${lanList[0]}"),
                        ),
                        CheckboxListTile(
                          value: lan2,
                          activeColor: Colors.teal.shade200,
                          onChanged: (value) {
                            setState(() {
                              lan2 = value!;
                            });
                          },
                          title: Text("${lanList[1]}"),
                        ),
                        CheckboxListTile(
                          value: lan3,
                          activeColor: Colors.teal.shade200,
                          onChanged: (value) {
                            setState(() {
                              lan3 = value!;
                            });
                          },
                          title: Text("${lanList[2]}"),
                        ),
                        CheckboxListTile(
                          value: lan4,
                          activeColor: Colors.teal.shade200,
                          onChanged: (value) {
                            setState(() {
                              lan4 = value!;
                            });
                          },
                          title: Text("${lanList[3]}"),
                        )
                      ],
                    ),
                  ),
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.teal,
                  collapsedBackgroundColor: Colors.teal.shade100,
                  title: Text(
                    "Work Experiance",
                    style: TextStyle(
                        color: Colors.teal, fontSize: 15, letterSpacing: 1),
                  ),
                  leading:
                      Icon(Icons.data_exploration_sharp, color: Colors.teal),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                          alignment: Alignment.center,
                          isExpanded: true,
                          items: expList
                              .map((e) => DropdownMenuItem(
                                    child: Text("$e"),
                                    value: e,
                                  ))
                              .toList(),
                          focusColor: Colors.teal.shade50,
                          hint: Text("Selecte Experiance"),
                          value: selectExp,
                          onChanged: (value) {
                            setState(() {
                              selectExp = value as String;
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ExpansionTile(
                  collapsedBackgroundColor: Colors.teal.shade100,
                  collapsedIconColor: Colors.teal,
                  title: Text(
                    "Expected Selery",
                    style: TextStyle(
                        color: Colors.teal, fontSize: 15, letterSpacing: 1),
                  ),
                  leading: Icon(Icons.attach_money, color: Colors.teal),
                  children: [
                    RangeSlider(
                      values: rangeValues,
                      labels: RangeLabels(
                        "${rangeValues.start.round()}",
                        "${rangeValues.end.round()}",
                      ),
                      onChanged: (value) {
                        setState(() {
                          rangeValues = value;
                        });
                      },
                      max: 100000,
                      divisions: 10,
                      activeColor: Colors.teal.shade200,
                      inactiveColor: Colors.teal.shade100,
                    )
                  ],
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    var skill = "";
                    if (lan1 == true) {
                      skill = "$skill Gujrati";
                    }
                    if (lan2 == true) {
                      skill = "$skill English";
                    }
                    if (lan3 == true) {
                      skill = "$skill Hindi";
                    }
                    if (lan4 == true) {
                      skill = "$skill Other";
                    }
                    var name = txtfname.text;
                    var surname = txtlname.text;
                    var add = txtadd.text;
                    var cont = txtcont.text;
                    var email = txtem.text;
                   DataModel datamodel=DataModel(name:name,add: add ,cont:cont ,edu: selectEdu,email:email ,exp:selectExp ,lan:skill ,path: path,rangeValues:rangeValues ,surname:surname );
                   Navigator.pushNamed(context, 'datascreen',arguments:datamodel);


                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade100),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  void showExitdailog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text("Are you sure to Exit !!!")),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Text("Yes"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("No"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                )
              ],
            )
          ],
        );
      },
    );
  }

  Future<bool> back() async {
    showExitdailog();

    return await false;
  }
}
