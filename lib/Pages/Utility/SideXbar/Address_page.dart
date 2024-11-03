import 'package:flutter/material.dart';
import 'package:fooduu/Pages/Home_pages/BottomNavigationButtons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final List<String> _addresses = []; // List to store addresses

  @override
  void initState() {
    super.initState();
    _loadAddresses(); // Load saved addresses when the page is initialized
  }

  // Function to load addresses from shared preferences
  Future<void> _loadAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _addresses.addAll(prefs.getStringList('addresses') ?? []); // Load stored addresses
    });
  }

  // Function to save addresses to shared preferences
  Future<void> _saveAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('addresses', _addresses); // Save updated addresses
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Addresses'),
        backgroundColor: Colors.blue,
        leading: IconButton( // Add back button
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(const MyHomePage()) ;// Close the current page
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: () {
              _showAddAddressDialog();
            },
          ),
        ],
      ),
      body: _addresses.isEmpty
          ? const Center(child: Text('No addresses added.'))
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _addresses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              title: Text(_addresses[index]),
              onTap: () {
                _showEditAddressDialog(_addresses[index], index); // Open edit dialog
              },
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _deleteAddress(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // Show dialog to add a new address
  void _showAddAddressDialog() {
    String newAddress = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Address'),
          content: TextField(
            onChanged: (value) {
              newAddress = value;
            },
            decoration: const InputDecoration(hintText: 'Enter your address'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newAddress.isNotEmpty) {
                  _addAddress(newAddress); // Add address if not empty
                  Navigator.of(context).pop(); // Close dialog
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // Show dialog to edit an existing address
  void _showEditAddressDialog(String currentAddress, int index) {
    String updatedAddress = currentAddress; // Store the current address for editing

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Address'),
          content: TextField(
            onChanged: (value) {
              updatedAddress = value; // Update the address while typing
            },
            controller: TextEditingController(text: currentAddress), // Set initial value
            decoration: const InputDecoration(hintText: 'Edit your address'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (updatedAddress.isNotEmpty) {
                  _editAddress(updatedAddress, index); // Edit address if not empty
                  Navigator.of(context).pop(); // Close dialog
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Add new address and save it
  void _addAddress(String address) {
    setState(() {
      _addresses.add(address); // Add the new address to the list
    });
    _saveAddresses(); // Save the updated list of addresses
  }

  // Edit existing address and save it
  void _editAddress(String address, int index) {
    setState(() {
      _addresses[index] = address; // Update the existing address
    });
    _saveAddresses(); // Save the updated list of addresses
  }

  // Delete address and save the updated list
  void _deleteAddress(int index) {
    setState(() {
      _addresses.removeAt(index); // Remove address from the list
    });
    _saveAddresses(); // Save the updated list of addresses
  }
}
