import 'package:aryanwheels_flutter/providers/vehicles_provider.dart';
import 'package:aryanwheels_flutter/util/mobile_text_size.dart';
import 'package:provider/provider.dart';
import '../util/colors.dart';
import '../models/vehicles_model.dart';
import '../widgets/post_card.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Search',
          style: TextStyle(
              fontSize: titleTxt,
              fontWeight: FontWeight.bold,
          ),
        ),
        actions:  [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
               showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
           },
          ),
        ],
      ),

      body: const Center(child: Text('search',style: TextStyle(color: Colors.blue),
    ),
      ),
    );
  }
}

  class CustomSearchDelegate extends SearchDelegate{


  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(
       icon: const Icon(Icons.clear),
         onPressed: (){
         query = '';
         },
     )
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
      close(context, null);
    },
        icon:const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Vehicle> matchQuery = [];
    var vehicles=Provider.of<VehiclesProvider>(context).vehicles;
    for(var vehicle in vehicles){
     if(vehicle.model.toString().toLowerCase().contains(query) ) {
       matchQuery.add(vehicle);
     }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return PostCard(vehicle: matchQuery[index]);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Vehicle> matchQuery = [];
    var vehicles=Provider.of<VehiclesProvider>(context).vehicles;
    for(var vehicle in vehicles){
      if(vehicle.model.toString().toLowerCase().contains(query)||
          vehicle.manufacturer.toString().toLowerCase().contains(query)||
          vehicle.modelYear.toString().toLowerCase().contains(query) ) {
        matchQuery.add(vehicle);
      }
    }
   return  ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          return PostCard(vehicle: matchQuery[index]);
        },
      );
  }

  }