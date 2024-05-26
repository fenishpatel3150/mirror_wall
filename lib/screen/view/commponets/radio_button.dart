
import 'package:flutter/material.dart';
import 'package:mirror_wall/screen/provider/Google_Provider.dart';
import 'package:provider/provider.dart';

RadioListTile<String> radiobutton(BuildContext context,String link,String name) {
  return RadioListTile(
    value: link,
    groupValue:
    Provider.of<Google_provider>(
        context,
        listen: true)
        .uri
        .toString(),
    onChanged: (value) {
      Provider.of<Google_provider>(context,
          listen: false).website(value!);
      Navigator.of(context).pop();
    },
  title: Text(name),
  );

}
