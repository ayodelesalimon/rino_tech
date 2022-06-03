// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rino_tech/util/string_util.dart';
import 'package:rino_tech/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _modalBottomSheetMenu() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          context: context,
          builder: (builder) {
            return new Container(
              height: 150.0,
              color:
                  Colors.transparent, //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: new Container(
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0))),
                  child: new Center(
                    child: new Text(StringUtils.online),
                  )),
            );
          });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_modalBottomSheetMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 150.0,
        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Text(
                  StringUtils.online,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                CustomButton(
                  text: "Go Offline",
                  borderRadius: 10,
                  borderColor: Colors.redAccent.shade100,
                  color: Colors.redAccent.shade100,
                  textColor: Color.fromARGB(255, 124, 10, 2),
                  width: MediaQuery.of(context).size.width / 2.5,
                )
              ],
            )),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
