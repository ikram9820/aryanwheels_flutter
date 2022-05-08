import 'dart:convert';
import 'dart:ui';
import 'package:aryanwheels_flutter/providers/vehicles_provider.dart';
import 'package:aryanwheels_flutter/util/mobile_text_size.dart';
import 'package:provider/provider.dart';
import '../util/colors.dart';
import '../models/vehicles_model.dart';
import '../widgets/post_card.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget{
  late Future<List<Vehicle>> vehicles;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        centerTitle: true,
        title: const Text('Aryanwheels',
            style: TextStyle(
              fontSize: titleTxt,
              fontWeight: FontWeight.bold,

            )),
      ),
      body: Column(
        children: [
          Consumer<VehiclesProvider>(
            builder: (_,allVehicles,child)=>Expanded(
              child: (allVehicles.isLoading) ?
                      const Center(
                        child: CircularProgressIndicator(),
                      ):
                     ListView.builder (
                      itemCount: allVehicles.count,
                      itemBuilder: (BuildContext context, int index) {
                        var data =  allVehicles.vehicles[index];
                        return PostCard(vehicle: data);
                      },
                    ),

              ),
          ),

        ],
  ),
    );
  }
}
