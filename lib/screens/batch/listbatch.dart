import 'package:Brolog/db/batch_db/batchdb.dart';
import 'package:flutter/material.dart';
import '../../db/models/BatchModel.dart';
import 'display_batch.dart';
//import 'listbatch.dart';

class ListBatchScreen extends StatelessWidget {
  const ListBatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: batchListNotifier,
      builder: (context, List<BatchModel> batchList, Widget? child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final data = batchList[index];
            return Padding(
              padding: const EdgeInsets.only(left: 100.0, right: 100.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.teal,
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      data.batch_name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(30.0),
                  //   side: BorderSide(color: Colors.grey),
                  // ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return DisplayBatch(
                            batch_name: data.batch_name,
                            location: data.location,
                            count: data.count,
                            lead_name: data.lead_name,
                            phnNumber: data.phnNumber,
                            index: index,
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: batchList.length,
        );
      },
    );
  }
}
