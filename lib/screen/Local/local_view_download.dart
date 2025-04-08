import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/notifier/share_notifier.dart';

class LocalViewDownload extends StatelessWidget {
  const LocalViewDownload({super.key});

  @override
  Widget build(BuildContext context) {
    final allData = Provider.of<ShareMapOfData>(context).theDataList;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 12,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    if (allData.isEmpty) {
                      const Center(
                        child: Text('No Data'),
                      );
                    }
                    return Column(
                      children: [
                        SelectableText(allData[index]['data']),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
