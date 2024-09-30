import 'package:FooDash_App/Pages/Downbar/BottomNavigationButtons.dart';
import 'package:FooDash_App/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  List<String> addresses = [
    '1234 Elm St, Springfield, IL',
    '5678 Oak St, Chicago, IL',
  ];

  // Google Maps Controller
  late GoogleMapController mapController;

  final LatLng _initialPosition = const LatLng(37.7749, -122.4194); // San Francisco Coordinates

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Addresses'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(()=>MyHomePage());
          },
        ),
      ),
      body: Column(
        children: [
          // Display Addresses List
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(addresses[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _showEditDialog(index: index); // Edit a specific address
                    },
                  ),
                );
              },
            ),
          ),
          // Display Google Map
          Expanded(
            child: Container(
              height: Dimension.height300,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _initialPosition,
                  zoom: 12.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('home'),
                    position: _initialPosition,
                    infoWindow: InfoWindow(title: 'Current Location'),
                  )
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to show a dialog to edit the address
  void _showEditDialog({int? index}) {
    String initialAddress = index != null ? addresses[index] : '';
    TextEditingController _controller = TextEditingController(text: initialAddress);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Add Address' : 'Edit Address'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Enter your address'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (index == null) {
                    // Add new address
                    addresses.add(_controller.text);
                  } else {
                    // Edit existing address
                    addresses[index] = _controller.text;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

void main() => runApp(MaterialApp(
  home: AddressPage(),
));
