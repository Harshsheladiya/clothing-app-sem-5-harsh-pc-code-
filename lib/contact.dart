import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:phone_call/phone_call.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:parichay_card/Card.dart';





class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  List<Contact>? contacts;
  List<Contact>? filteredContacts;

  get searchText => null;

  @override
  void initState() {
    super.initState();
    getPhoneData();
  }

  void getPhoneData() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,

      );
      filteredContacts = contacts;
      setState(() {});

    }
  }

  void filterContacts(String searchText, Function buttonCallback) {
    filteredContacts = contacts?.where((contact) {
      return contact.name.first.toLowerCase().contains(searchText.toLowerCase()) ||
          contact.name.last.toLowerCase().contains(searchText.toLowerCase());
    }).toList();


    setState(() {});
  }
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("AppBar");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu), onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyForm()),
          );
        },
        ),


        title: cusSearchBar,

        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (searchText) {
              filterContacts(searchText, () {
                // Do something when the button is pressed
              });
            },
            decoration: InputDecoration(
              hintText: "Search contacts...",
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts?.length ?? 0,
              itemBuilder: (BuildContext context, index) {
                Uint8List? image = filteredContacts![index].photo;
                String num = (filteredContacts![index].phones.isNotEmpty)
                    ? (filteredContacts![index].phones.first.number)
                    : "--";
                return ListTile(
                  leading: (image == null)
                      ? CircleAvatar(child: Icon(Icons.person))
                      : CircleAvatar(
                    backgroundImage: MemoryImage(image),
                  ),
                  title: Text(
                      "${filteredContacts![index].name.first} ${filteredContacts![index].name.last}"),
                  subtitle: Text(num),
                  onTap: () async {
                    await launchUrl(FlutterPhoneDirectCaller.callNumber(
                        'tel ${num}') as Uri);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}