import 'package:flutter/material.dart';
import 'package:mirror_wall/screen/provider/Google_Provider.dart';
import 'package:provider/provider.dart';

class Book_mark_screen extends StatelessWidget {
  const Book_mark_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookMark'),
      ),
      body: Column(
        children: [
     ...List.generate(
      Provider.of<Google_provider>(context, listen: false)
          .bookmark
          .length,
            (index) =>ListTile(
              onTap: () {
                Provider.of<Google_provider>(context,listen: true).bookmark[index];
                Navigator.of(context).pop();
              },
              title:Text(Provider.of<Google_provider>(context,listen: false).bookmark[index]),
              subtitle: Text(Provider.of<Google_provider>(context,listen: true).bookmark[index]),

              trailing: IconButton(onPressed: () {
              Provider.of<Google_provider>(context,listen: false).remove(index);
              }, icon: Icon(Icons.cancel_rounded),),
            ) ),

    ],
      ),
    );
  }
}
