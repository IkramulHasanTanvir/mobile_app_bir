import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile_app_bir/futures/transactions/views/widgets/transaction_card.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class PrintDialog extends StatelessWidget {
  const PrintDialog({
    super.key,
    required this.transaction,
    required this.size,
  });

  final Map<String, dynamic> transaction;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Print Transaction'),
      content: TransactionCard(
        isDialog: true,
        billNo: transaction['billNo'],
        date: transaction['date'],
        accountTitle: transaction['accountTitle'],
        totalProduct: transaction['totalProduct'],
        billed: transaction['billed'],
        received: transaction['received'],
        status: transaction['status'],
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pop(); // Close dialog
            // Printing logic
            await Printing.layoutPdf(
              onLayout: (format) async {
                final pdf = pw.Document();
                pdf.addPage(
                  pw.Page(
                    pageFormat: PdfPageFormat.a4,
                    build: (pw.Context context) {
                      return pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'Transaction Details',
                            style: pw.TextStyle(
                              fontSize: 20,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          pw.SizedBox(height: 10),
                          pw.Container(
                            padding: pw.EdgeInsets.all(10),
                            margin: pw.EdgeInsets.symmetric(
                                vertical: size.height * 0.010),
                            decoration: pw.BoxDecoration(
                                borderRadius: pw.BorderRadius.circular(16),
                                border: pw.Border.all(
                                  width: 1.0,
                                ),
                                boxShadow: [pw.BoxShadow(blurRadius: 5)]),
                            child: pw.Column(
                              mainAxisSize: pw.MainAxisSize.min,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text(
                                      'Bill No: ${transaction['billNo']}',
                                    ),
                                    pw.Text(
                                      'Date: ${transaction['date']}',
                                    ),
                                  ],
                                ),
                                pw.Divider(),
                                pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text(
                                      'Account Tile : ${transaction['accountTitle']}',
                                    ),
                                  ],
                                ),
                                pw.SizedBox(height: 8),
                                pw.Text(
                                    'Total Product : ${transaction['totalProduct']}'),
                                pw.Text(
                                    'Billed : ${transaction['billed']} BDT'),
                                pw.SizedBox(height: 8),
                                pw.Divider(),
                                pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Column(
                                      crossAxisAlignment:
                                          pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text(
                                          'Received : ${transaction['received']}',
                                        ),
                                        pw.Text(
                                          'Date: ${transaction['date']}',
                                        ),
                                      ],
                                    ),
                                    pw.Text('${transaction['status']}')
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );

                // Save the document
                final output = await getTemporaryDirectory();
                final file = File("${output.path}/transaction.pdf");
                await file.writeAsBytes(await pdf.save());
                ;

                return pdf.save();
              },
            );
          },
          child: const Text('Print'),
        ),
      ],
    );
  }
}
