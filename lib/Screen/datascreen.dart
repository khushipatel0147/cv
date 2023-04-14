import 'dart:io';

import 'package:cv/class/modelclass.dart';
import 'package:cv/utiles/pdfCreate.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';


class SaveData extends StatefulWidget {
  const SaveData({Key? key}) : super(key: key);

  @override
  State<SaveData> createState() => _SaveDataState();
}

class _SaveDataState extends State<SaveData> {
  @override
  Widget build(BuildContext context) {
    DataModel d1= ModalRoute.of(context)?.settings.arguments as DataModel;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CV",style :
          TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1)
        ),
        backgroundColor: Colors.teal,
        actions: [
          InkWell(onTap: () async {
            await Printing.layoutPdf(onLayout: (format) => PdfMaker(d1),);
          },
            child: Padding(
              padding: const EdgeInsets.only(right:12),
              child: Icon(Icons.download,color: Colors.white,size: 25,
              ),
            ),
          ),
        ],
      ),
    body: Row(
      children: [
      Container(
        height: double.infinity,width: 150,
        color: Colors.teal.shade100,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundImage: FileImage(File("${d1.path}")),radius: 65,backgroundColor: Colors.teal.shade50,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Contacts",style: TextStyle(
                letterSpacing: 2,fontWeight: FontWeight.bold,color: Colors.teal,fontSize: 20
            ),),
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Icon(Icons.location_on,color: Colors.black,size: 15,),
              ),
              SizedBox(width: 10),
              Text("${d1.add}",style: TextStyle(
                  fontSize: 13,letterSpacing: 1,color: Colors.black
              ),)
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Icon(Icons.phone,color: Colors.black,size: 15,),
              ),
              SizedBox(width: 10),
              Text("${d1.cont}",style: TextStyle(
                  fontSize: 13,letterSpacing: 1,color: Colors.black
              ),)
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,bottom: 30),
                child: Icon(Icons.email,color: Colors.black,size: 15,),
              ),
              SizedBox(width: 10),
              Container(
                height: 50,width: 80,
                child: Text("${d1.email}",style: TextStyle(
                    fontSize: 13,letterSpacing: 1,color: Colors.black
                ),),
              )
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Objective",style: TextStyle(
                letterSpacing: 2,fontWeight: FontWeight.bold,color: Colors.teal,fontSize: 20
            ),),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("To Secure the Position of  Dialer Administrator that will allow me to utlize acquired skills and Experience.",style: TextStyle(
                color: Colors.black,fontSize: 13,letterSpacing: 1
            ),),
          ),
        ],
    ),
      ),
      Expanded(
        child: Container(
          height: double.infinity,width: 100,
          color: Colors.teal.shade50,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("${d1.name}",style: TextStyle(color: Colors.teal,letterSpacing: 1,fontSize: 35),),
            ),
            Divider(height: 5,thickness: 1,color: Colors.teal),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("${d1.surname}",style: TextStyle(color: Colors.teal,letterSpacing: 1,fontSize: 35),),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Language Information",style: TextStyle(color: Colors.teal,letterSpacing: 2,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15),
            Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("✔️${d1.lan}",style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 18),),
          ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Education Information",style: TextStyle(color: Colors.teal,letterSpacing: 2,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("✔️ ${d1.edu}",style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 18),),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Work Experiance",style: TextStyle(color: Colors.teal,letterSpacing: 2,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("✔️ ${d1.exp}",style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 18),),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Expected Selery ",style: TextStyle(color: Colors.teal,letterSpacing: 2,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("✔️ ${d1.rangeValues!.start.toInt()} - ${d1.rangeValues!.end.toInt()}",style: TextStyle(color: Colors.black,letterSpacing: 1,fontSize: 18),),
            ),
          ],
    ),
        ),
      ),
      ],
    )
    ),
    );
  }
}

