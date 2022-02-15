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
      "title": "Ein Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
    },
    {
      "title": "Ein 2ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
    },
    {
      "title": "Ein 3ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
    },
    {
      "title": "Ein 4ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
    },
    {
      "title": "Ein 5ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
    },
    {
      "title": "Ein 6ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
    },
    {
      "title": "Ein 7ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
    },
    {
      "title": "Ein 8ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
    },
    {
      "title": "Ein 9ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
    },
    {
      "title": "Ein 10ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
    },
    {
      "title": "Ein 11ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
    },
    {
      "title": "Ein 12ter Buchtitel eben",
      "author": "Autor Schreiber",
      "isbn": "123-4-8523-5236-4",
      "timeStamp": "28.02.2022"
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
              (context, index) => ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.blue.shade300,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                title: Text(jsonList[index]["title"]),
                subtitle: Text(
                    "${jsonList[index]["author"]}\n${jsonList[index]["isbn"]}"),
                trailing: Text(jsonList[index]["timeStamp"]),
              ),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
