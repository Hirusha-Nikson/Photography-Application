import 'package:flutter/material.dart';
import 'package:photograohy_app/pages/exposure_time/calculate_500.dart';

import 'dart:math' as math;

import 'package:photograohy_app/pages/exposure_time/calculate_npf.dart';

class Exposure extends StatefulWidget {
  const Exposure({super.key});

  @override
  State<Exposure> createState() => _ExposureState();
}

class _ExposureState extends State<Exposure> {
//Variables

  double declination = 0.0;
  double lensAperture = 0.0;
  double focalLength = 0.0;
  double pixelSize = 0.0;
  double npfValue = 0.0;
  double _result500 = 0.0;

  final List<String> _cameraSensors = [
    'Full Frame (35mm)',
    'APS-C (Canon EF-S/EF-M\n1.6x)',
    'APS-C (Nikon DX, Sigma\nFoveon X3, Fujifilm X,\nPentax K,Sony DT\n&E-NEX 1.5x)',
    'APS-H (Canon, Leica M8)',
    'Medium Format (Leaf,\nHasselblad, Phase One,\nPentax 645D, Fujifilm\nGFX 0.79x)',
    'Medium Format (0.64x)',
    '1 (Nikon 1,CX, Sony RX,\nCanon G7 x 2.7x)',
    '4/3 Four Thrird (Olympus\nPanasonic 1.84x)',
  ];

  String _SelectedCamera = "Full Frame (35mm)";

  double _degreesToRadians(double degrees) {
    return degrees * (math.pi / 180.0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Exposure Time"),
        ),
        body: ListView(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(10),
                color: Colors.grey.shade800,
                child: Column(
                  children: [
                    const Center(
                      child: Text("Exposure time night sky photography"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: const BoxDecoration(),

                            //Camera,Sensor
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.party_mode,
                                    color: Colors.white),
                                const Text(
                                  "Camera / Sensor :",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                    width: 200,
                                    child: DropdownButtonFormField(
                                      dropdownColor: Colors.grey.shade800,
                                      alignment: AlignmentDirectional.center,
                                      style:
                                          const TextStyle(color: Colors.green),
                                      value: _SelectedCamera,
                                      items: _cameraSensors
                                          .map((e) => DropdownMenuItem<String>(
                                                value: e,
                                                child: Text(e),
                                              ))
                                          .toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _SelectedCamera = newValue!;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_drop_down_circle_outlined,
                                        color: Colors.green,
                                      ),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ))
                              ],
                            ),
                          ),
                        ),

                        //Aperture
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: const BoxDecoration(
                                  //border: Border.all(color: Colors.amber),
                                  ),
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  ),
                                  const Text(
                                    "Aperture (F-stop) :",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                      width: 200,
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            lensAperture = double.parse(value);
                                          });
                                        },
                                        style: const TextStyle(
                                          color: Colors.green,
                                        ),
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            prefixText: "f/",
                                            prefixStyle: TextStyle(
                                              color: Colors.green,
                                            ),
                                            helperText:
                                                "Use the fastest aperture value that your lens have",
                                            helperMaxLines: 2,
                                            helperStyle: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 10)),
                                      ))
                                ],
                              )),
                        ),

                        //Focul Length
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: const BoxDecoration(
                                  //border: Border.all(color: Colors.amber),
                                  ),
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.straighten,
                                    color: Colors.white,
                                  ),
                                  const Text(
                                    "Focul Length : ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                      width: 200,
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            focalLength = double.parse(value);
                                          });
                                        },
                                        style: const TextStyle(
                                          color: Colors.green,
                                        ),
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                            suffixText: "mm",
                                            suffixStyle: TextStyle(
                                              color: Colors.green,
                                            )),
                                      ))
                                ],
                              )),
                        ),

                        //Declination
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.architecture,
                                  color: Colors.white,
                                ),
                                const Text(
                                  "Declination : ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                    width: 200,
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          declination = double.parse(value);
                                        });
                                      },
                                      style: const TextStyle(
                                        color: Colors.green,
                                      ),
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          suffixText: "∠",
                                          suffixStyle: TextStyle(
                                            color: Colors.green,
                                          ),
                                          helperText:
                                              'Area of ​​the sky you are targeting, Put 0° if you do not know it',
                                          helperMaxLines: 2,
                                          helperStyle: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white70)),
                                    ))
                              ],
                            ),
                          ),
                        ),

                        //Pixel Size
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.animation,
                                  color: Colors.white,
                                ),
                                const Text(
                                  "Pixel Size/Spread : ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                    width: 200,
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          pixelSize = double.parse(value);
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        color: Colors.green,
                                      ),
                                      decoration: const InputDecoration(
                                          hintText: "3 - 6",
                                          hintStyle: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white70),
                                          helperText:
                                              'Tack-sharp stars: 3, General usage: 6',
                                          helperStyle: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white70,
                                          )),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //NPD value
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                npfValue = NpfCalculator.calculateNpf(
                                    declination: declination,
                                    lensAperture: lensAperture,
                                    focalLength: focalLength,
                                    pixelSize: pixelSize);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('NPF Value'),
                          ),

                          //500 Rule
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _result500 = CalculationService.calculateRule(
                                      _SelectedCamera, focalLength);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('500 Rule'))
                        ],
                      ),
                    ),
                    //Button

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade800,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "NPF value ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Calculate the exposure time for pin point stars\nwhen shooting without star tracking.",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  "${npfValue.toStringAsFixed(1)} Sec",
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          )),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade800,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "500 Rule ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Classic rule. fails with cameras, recent very\nopen lenses,and smartphones.",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 80,
                                child: Text(
                                  "${_result500.toStringAsFixed(1)} Sec",
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              )
                            ],
                          )),
                    ),

//Note
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade800,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Notes :",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  RichText(
                                      text: const TextSpan(children: [
                                    TextSpan(
                                        text: "Note 1 :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text:
                                            "The NFP rule is a rule that makes it (fairly)\n easy to calculate the maximum exposure time to\ntake a photo of a starry sky without the stars trailing\n too much.This rule replaces the old “rule of 500”\nwhich gives results that are too uncertain.",
                                        style: TextStyle(color: Colors.white70))
                                  ]))
                                ],
                              ),
                            ],
                          )),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
