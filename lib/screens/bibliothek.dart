import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class BibliothekPage extends StatefulWidget {
  @override
  BibliothekPageState createState() => BibliothekPageState();
}

class BibliothekPageState extends State<BibliothekPage> {
  final List<String> items = List<String>.generate(100, (i) => 'Item $i');

  @override
  void initState() {
    super.initState();
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 1000,
            ),
          ),
        ],
      ),
    );
  }
}
