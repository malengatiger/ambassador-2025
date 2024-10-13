import 'dart:convert';

import 'package:ambassador_app/data/ticket.dart';
import 'package:ambassador_app/utils/functions.dart';
import 'package:ambassador_app/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import 'data/data_schemas.dart';

class QRScannerWidget extends StatefulWidget {
  const QRScannerWidget(
      {super.key,
      required this.onVehicleScanned,
      required this.onUserScanned,
      required this.onTicketScanned,
      required this.onCommuterScanned});

  final Function(Vehicle) onVehicleScanned;
  final Function(User) onUserScanned;
  final Function(Ticket) onTicketScanned;
  final Function(Commuter) onCommuterScanned;

  @override
  State<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  String? _scanResult;
  User? userScanned;
  Vehicle? carScanned;
  Commuter? commuterScanned;
  Ticket? ticketScanned;

  String? typeString;
  static const mm = '🍎🍎🍎 QRScannerWidget 🍎';

  _navigateToScan() async {
    _scanResult = await NavigationUtils.navigateTo(
        context: context,
        widget: const SimpleBarcodeScannerPage(),
        transitionType: PageTransitionType.leftToRight);
    pp('$mm scan result: $_scanResult');
    if (_scanResult != null) {
      var mJson = jsonDecode(_scanResult!);
      if (mJson['vehicleId'] != null) {
        carScanned = Vehicle.fromJson(mJson);
        typeString = 'Vehicle';
        widget.onVehicleScanned(carScanned!);
      }
      if (mJson['userId'] != null) {
        userScanned = User.fromJson(mJson);
        typeString = 'User';
        widget.onUserScanned(userScanned!);
      }
      if (mJson['commuterId'] != null) {
        commuterScanned = Commuter.fromJson(mJson);
        typeString = 'Commuter';
        widget.onCommuterScanned(commuterScanned!);
      }
      if (mJson['ticketId'] != null) {
        ticketScanned = Ticket.fromJson(mJson);
        typeString = 'Ticket';
        widget.onTicketScanned(ticketScanned!);
      }

      pp('\n\n$mm scanned: 🍎 $typeString 🍎');
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanner'),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  _navigateToScan();
                },
                child: Text(
                  'Start Scanning',
                  style: myTextStyle(fontSize: 24, weight: FontWeight.bold),
                )),
          ),
          _scanResult == null
              ? gapW32
              : Column(
                  children: [
                    Text(
                      'Scan Result',
                      style: myTextStyle(weight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      '$typeString',
                      style: myTextStyle(
                          color: Colors.green.shade800,
                          fontSize: 20,
                          weight: FontWeight.w900),
                    ),
                    gapH32,
                    Expanded(
                      child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text('$_scanResult'),
                          )),
                    ),
                  ],
                ),
        ],
      )),
    );
  }
}
