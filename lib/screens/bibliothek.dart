import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class BibliothekPage extends StatefulWidget {
  @override
  BibliothekPageState createState() => BibliothekPageState();
}

class BibliothekPageState extends State<BibliothekPage> {
  final List<String> items = List<String>.generate(10000, (i) => 'Item $i');

  @override
  void initState() {
    super.initState();
  }

//  Container(
//               //  //Text("valuelibraryId."),
//               height: 200,
//               child: SfBarcodeGenerator(
//                 value: '05601205784',
//                 symbology: Code128(),
//                 showValue: true,
//               ),
//             ),

  bool _pinned = true;
  bool _snap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            //pinned: _pinned,
            //snap: _snap,
            floating: true,
            backgroundColor: Colors.white,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
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
                child: const Text('Scroll to see the SliverAppBar in effect.'),
              ),
            ),
          ),
          // Next, create a SliverList
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildBuilderDelegate(
              // The builder function returns a ListTile with a title that
              // displays the index of the current item.
              (context, index) => ListTile(title: Text('Item #$index')),
              // Builds 1000 ListTiles
              childCount: 1000,
            ),
          ),
        ],
      ),
    );
  }
}
