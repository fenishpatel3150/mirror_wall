import 'package:flutter/material.dart';
import 'package:mirror_wall/screen/provider/Google_Provider.dart';
import 'package:provider/provider.dart';

class History_screen extends StatelessWidget {
  const History_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Column(
        children: [
          ...List.generate(
              Provider.of<Google_provider>(context, listen: false)
                  .history
                  .length,
              (index) => ListTile(
                    onTap: () {
                      Provider.of<Google_provider>(context, listen: true)
                          .history[index];
                      Navigator.of(context).pop();
                    },
                    title: Text(
                        Provider.of<Google_provider>(context, listen: false)
                            .history[index]),
                    subtitle: Text(
                        Provider.of<Google_provider>(context, listen: true)
                            .history[index]),
                    trailing: IconButton(
                      onPressed: () {
                        Provider.of<Google_provider>(context, listen: false)
                            .removehistory(index);
                      },
                      icon: Icon(Icons.cancel_rounded),
                    ),
                  )),
        ],
      ),
    );
  }
}
