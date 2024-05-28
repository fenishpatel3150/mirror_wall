

import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/screen/view/Crome_screen.dart';

class Google_provider extends ChangeNotifier
{
   String search="";
   double progress=0;
   String? currenturl;
   String? currenthistory;
   String? title;
   WebUri uri= WebUri('');
   List<String> bookmark=[];
   List<String> history=[];
   bool back=false;
   bool forward=false;

   int browser =0;

   void Search(String search)
   {
     this.search=search;
    notifyListeners();
   }

   void Progress(int progress)
   {
     this.progress=progress/100;
     notifyListeners();

   }

   Future<void> addurl(url)
   async {

     currenturl=url.toString();
     currenthistory=url.toString();
     title=await inAppWebViewController.getTitle();

     notifyListeners();

   }

   void addlist()
   {
     bookmark.add(currenturl!);
     history.add(currenthistory!);
     notifyListeners();
   }

   void removehistory(index)
   {
        history.removeAt(index);
        notifyListeners();
   }

   void website(value)
   {
     uri= WebUri(value);
     inAppWebViewController.loadUrl(urlRequest: URLRequest(url: uri));
   }

   void radiobutton(int value)
   {
     browser=value;
     notifyListeners();
   }

   void remove(index)
   {
     bookmark.removeAt(index);
     notifyListeners();
   }

   Future<void> goback()
   async {
     await inAppWebViewController.goBack();
     notifyListeners();
   }

   Future<void> goForward()
   async {
    await inAppWebViewController.goForward();
    notifyListeners();
   }


}

