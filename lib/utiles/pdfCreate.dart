import 'dart:io';
import 'dart:typed_data';

import 'package:cv/class/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<Uint8List> PdfMaker(DataModel d1) async {
  var pdf = pw.Document();
  pdf.addPage(pw.Page(
      theme: pw.ThemeData.withFont(
        base: await PdfGoogleFonts.varelaRoundRegular(),
        bold: await PdfGoogleFonts.varelaRoundRegular(),
        icons: await PdfGoogleFonts.materialIcons(),
      ),
        margin: pw.EdgeInsets.all(10),
    pageFormat: PdfPageFormat.a4,
    orientation: pw.PageOrientation.portrait,
    build: (context) {
      return pw.Row(
        children: [
          pw.Container(
            height: double.infinity,
            width: 150,
            color: PdfColors.teal100,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.SizedBox(height: 25),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 10),
                  child: pw.ClipOval(
                      child: pw.Image(pw.MemoryImage(
                          File("${d1.path}").readAsBytesSync()))),
                ),
                pw.SizedBox(height: 25),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 10),
                  child: pw.Text(
                    "Contacts",
                    style: pw.TextStyle(
                        letterSpacing: 2,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.teal,
                        fontSize: 20),
                  ),
                ),
                pw.SizedBox(height: 25),
                pw.Row(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(left: 15),
                      child: pw.Icon(
                        pw.IconData(0xe0c8),
                        color: PdfColors.black,
                        size: 15,
                      ),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "${d1.add}",
                      style: pw.TextStyle(
                          fontSize: 13,
                          letterSpacing: 1,
                          color: PdfColors.black),
                    )
                  ],
                ),
                pw.SizedBox(height: 15),
                pw.Row(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(left: 15),
                      child: pw.Icon(
                        pw.IconData(0xe0b0),
                        color: PdfColors.black,
                        size: 15,
                      ),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Text(
                      "${d1.cont}",
                      style: pw.TextStyle(
                          fontSize: 13,
                          letterSpacing: 1,
                          color: PdfColors.black),
                    )
                  ],
                ),
                pw.SizedBox(height: 15),
                pw.Row(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(left: 15, bottom: 30),
                      child: pw.Icon(
                        pw.IconData(0xe0be),
                        color: PdfColors.black,
                        size: 15,
                      ),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Container(
                      height: 50,
                      width: 80,
                      child: pw.Text(
                        "${d1.email}",
                        style: pw.TextStyle(
                            fontSize: 13,
                            letterSpacing: 1,
                            color: PdfColors.black),
                      ),
                    )
                  ],
                ),
                pw.SizedBox(height: 15),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 10),
                  child: pw.Text(
                    "Objective",
                    style: pw.TextStyle(
                        letterSpacing: 2,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.teal,
                        fontSize: 20),
                  ),
                ),
                pw.SizedBox(height: 25),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 15),
                  child: pw.Text(
                    "To Secure the Position of  Dialer Administrator that will allow me to utlize acquired skills and Experience.",
                    style: pw.TextStyle(
                        color: PdfColors.black, fontSize: 13, letterSpacing: 1),
                  ),
                ),
              ],
            ),
          ),
          pw.Expanded(
            child: pw.Container(
              height: double.infinity,
              width: 100,
              color: PdfColors.teal50,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 45),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 15),
                    child: pw.Text(
                      "${d1.name}",
                      style: pw.TextStyle(
                          color: PdfColors.teal,
                          letterSpacing: 1,
                          fontSize: 35),
                    ),
                  ),
                  pw.Divider(height: 5, thickness: 1, color: PdfColors.teal),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 15),
                    child: pw.Text(
                      "${d1.surname}",
                      style: pw.TextStyle(
                          color: PdfColors.teal,
                          letterSpacing: 1,
                          fontSize: 35),
                    ),
                  ),
                  pw.SizedBox(height: 25),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 15),
                    child: pw.Text(
                      "Language Information",
                      style: pw.TextStyle(
                          color: PdfColors.teal,
                          letterSpacing: 2,
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(left: 15),
                    child: pw.Row(
                      children: [
                        pw.Icon(pw.IconData(0xe5df)),
                        pw.SizedBox(width: 10),
                        pw.Text("${d1.lan}",style: pw.TextStyle(color: PdfColors.black,letterSpacing: 1,fontSize: 18),),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 25),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 15),
                    child: pw.Text(
                      "Education Information",
                      style: pw.TextStyle(
                          color: PdfColors.teal,
                          letterSpacing: 2,
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(left: 15),
                    child: pw.Row(
                      children: [
                        pw.Icon(pw.IconData(0xe5df)),
                        pw.SizedBox(width: 10),
                        pw.Text("${d1.edu}",style: pw.TextStyle(color: PdfColors.black,letterSpacing: 1,fontSize: 18),),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 25),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 15),
                    child: pw.Text(
                      "Work Experiance",
                      style: pw.TextStyle(
                          color: PdfColors.teal,
                          letterSpacing: 2,
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(left: 15),
                    child: pw.Row(
                      children: [
                        pw.Icon(pw.IconData(0xe5df)),
                        pw.SizedBox(width: 10),
                        pw.Text("${d1.exp}",style: pw.TextStyle(color: PdfColors.black,letterSpacing: 1,fontSize: 18),),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 25),
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(left: 15),
                    child: pw.Text(
                      "Expected Selery ",
                      style: pw.TextStyle(
                          color: PdfColors.teal,
                          letterSpacing: 2,
                          fontSize: 20,
                          fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Padding(
                    padding: pw.EdgeInsets.only(left: 15),
                    child: pw.Row(
                      children: [
                        pw.Icon(pw.IconData(0xe5df)),
                        pw.SizedBox(width: 10),
                        pw.Text("${"${d1.rangeValues!.start.toInt()} - ${d1.rangeValues!.end.toInt()}"}",style: pw.TextStyle(color: PdfColors.black,letterSpacing: 1,fontSize: 18),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  ));
  return await pdf.save();
}
