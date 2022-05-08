import 'package:aryanwheels_flutter/util/mobile_text_size.dart';

import './seller_profile.dart';
import '../util/colors.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Sell car',
            style: TextStyle(
              fontSize: titleTxt,
              fontWeight: FontWeight.bold,
            )),
        actions:  [
          TextButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('processing data')),);

                  Navigator.pop(context);
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('processing data failed')),);
              },
              child: const Text('save',style:TextStyle(color:Colors.white),)),
        ],
      ) ,

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextFormField(
                          validator: (value){
                            if(value==null || value.isEmpty) {
                              return "Please enter some value";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(labelText: 'manufacturer'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextFormField(
                          validator: (value){
                            if(value==null || value.isEmpty) {
                              return "Please enter some value";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(labelText: 'model'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextFormField(
                          validator: (value){
                            if(value==null || value.isEmpty) {
                              return "Please enter some value";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(labelText: 'model year'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: TextFormField(
                  validator: (value){
                    if(value==null || value.isEmpty) {
                      return "Please enter some value";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'distance traveled'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: TextFormField(
                  validator: (value){
                    if(value==null || value.isEmpty) {
                      return "Please enter some value";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: TextFormField(
                  validator: (value){
                    if(value==null || value.isEmpty) {
                      return "Please enter some value";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'description'),
                  textInputAction: TextInputAction.newline,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                ),
              ),

              Card(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  child: const Center(child: Icon( Icons.add_photo_alternate_outlined,color:Colors.grey,size: 60,)),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.rectangle
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
