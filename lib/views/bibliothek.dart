import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:ohm_card/models/models.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class BibliothekPage extends StatefulWidget {
  BibliothekPage({Key? key}) : super(key: key);
  @override
  BibliothekPageState createState() => BibliothekPageState();
}

class BibliothekPageState extends State<BibliothekPage> {
  var _libraryId;
  var medium = new Medium();

  _getLibraryId() async {
    Map<String, dynamic> userMap;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userStr = prefs.getString('user') ?? "";
    userMap = jsonDecode(userStr) as Map<String, dynamic>;

    setState(() {
      _libraryId = LoginResponseModel.fromJson(userMap).libraryId;
    });
  }

  final List jsonList = [
    {
      "title": "RFID and contactless smart card applications",
      "author": "Paret, Dominique",
      "isbn": "0470016159",
      "timeStamp": "2022-12-04"
    },
    {
      "title": "Brainstorming, Brainstorming Rules and Decision Making",
      "author": "PUTMAN, VICKY L.; PAULUS, PAUL B.",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "2022-12-04"
    },
    {
      "title": "RFID-Handbuch",
      "author": "Finkenzeller, Klaus",
      "isbn": "9783827321992",
      "timeStamp": "2022-07-14"
    },
    {
      "title": "Mobile Payment",
      "author": "Hierl, Ludwig",
      "isbn": "978-3-658-14117-2",
      "timeStamp": "2022-07-14"
    },
    {
      "title": "Strichcode-Praxis",
      "author": "Lenk, Bernhard",
      "isbn": "3935551029",
      "timeStamp": "2022-07-14"
    },
    {
      "title": "Ein 6ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "2022-07-14"
    },
    {
      "title": "Ein 7ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "2022-07-14"
    },
    {
      "title": "Ein 8ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "2022-08-24"
    },
    {
      "title": "Ein 9ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "2022-08-24"
    },
    {
      "title": "Ein 10ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "2022-08-24"
    }
  ];

  @override
  void initState() {
    super.initState();
    _getLibraryId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            backgroundColor: Colors.white,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: (SfBarcodeGenerator(
                // value:'${_libraryId}',
                value: '05601205784',
                symbology: Code128(),
                showValue: true,
              )),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: const Text('Scroll to hide the barcode.'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.all(10.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.blueGrey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  title: Text(jsonList[index]["title"]),
                  subtitle: Text(
                      "${jsonList[index]["author"]}\n${jsonList[index]["isbn"]}"),
                  trailing: Text(jsonList[index]["timeStamp"]),
                ),
              ),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
