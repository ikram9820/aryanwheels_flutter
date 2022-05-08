import 'package:flutter/material.dart';
class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
        Key? key,
        required this.mobileScreenLayout,
        required this.webScreenLayout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraint){
          if(constraint.maxWidth> 600){
            return mobileScreenLayout;
          }
          return mobileScreenLayout;
        },
    );
  }
}
