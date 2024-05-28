import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/screen/provider/Google_Provider.dart';
import 'package:mirror_wall/screen/view/commponets/book_mark_link_screen.dart';
import 'package:mirror_wall/screen/view/commponets/listhistory.dart';
import 'package:mirror_wall/screen/view/commponets/radio_button.dart';
import 'package:mirror_wall/screen/view/home_page.dart';
import 'package:provider/provider.dart';

late InAppWebViewController inAppWebViewController;
PullToRefreshController pullrefreshcontroller =
    PullToRefreshController(onRefresh: () {
  inAppWebViewController.reload();
});

class Chrome_Screen extends StatelessWidget {
  const Chrome_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<Google_provider>(context, listen: false).addlist();
              },
              icon: Icon(Icons.bookmark_added_outlined)),
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.bookmark_add_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Book_mark_screen(),
                                      ));
                                },
                                child: Text('All BookMarks')),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.image_search),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      backgroundColor: Colors.white,
                                      title:
                                          Center(child: Text('Search Engine')),
                                      actions: [
                                        radiobutton(context,
                                            'https://www.google.com', 'Google'),
                                        radiobutton(
                                            context,
                                            'https://in.search.yahoo.com/',
                                            'Yahoo'),
                                        radiobutton(context,
                                            'https://www.bing.com/', 'Bing'),
                                        radiobutton(
                                            context,
                                            'https://duckduckgo.com/',
                                            'Duck Duck Go'),
                                      ],
                                    ),
                                  );
                                },
                                child: Text('Search Engine')),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.history),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => History_screen(),
                                      ));
                                },
                                child: Text('History')),
                          ],
                        ),
                      ],
                    ))
                  ]),
        ],
        title: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 20, offset: Offset.infinite)]),
          child: TextFormField(
            controller: txtsearch,
            decoration: InputDecoration(
                hintText: 'Search....',
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                    onPressed: () {
                      Provider.of<Google_provider>(context, listen: false)
                          .Search(txtsearch.text);
                      inAppWebViewController.loadUrl(
                          urlRequest: URLRequest(
                              url: WebUri(
                                  'https://www.google.com/search?q=${Provider.of<Google_provider>(context, listen: false).search}&rlz=1C1ONGR_enIN1095IN1095&oq=flutter&gs_lcrp=EgZjaHJvbWUqDggAEEUYJxg7GIAEGIoFMg4IABBFGCcYOxiABBiKBTIGCAEQRRg7MgkIAhAAGBMYgAQyCQgDEAAYExiABDIJCAQQABgTGIAEMgYIBRBFGD0yBggGEEUYPDIGCAcQRRg80gEJMTIxODJqMGo3qAIAsAIA&sourceid=chrome&ie=UTF-8')));
                    },
                    icon: Icon(Icons.search)),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none)),
          ),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
                url: WebUri(
                    'https://www.google.com/search?q=${Provider.of<Google_provider>(context, listen: false).search}&sca_esv=680b12c94771f77f&sca_upv=1&sxsrf=ADLYWIL7yMbHTwni04YbecJFVZ7z8KBb-Q%3A1716530603795&source=hp&ei=qy1QZv6-Lbux0-kPmLuOmAc&iflsig=AL9hbdgAAAAAZlA7u_40g8VdlYlIob8vNwe2yXXNXUIj&oq=&gs_lp=Egdnd3Mtd2l6IgAqAggAMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCMgcQIxgnGOoCSLwRUABYAHABeACQAQCYAQCgAQCqAQC4AQHIAQCYAgGgAgyoAgqYAwySBwExoAcA&sclient=gws-wiz')),
            onWebViewCreated: (controller) {
              inAppWebViewController = controller;
            },
            onProgressChanged: (controller, progress) {
              Provider.of<Google_provider>(context, listen: false)
                  .Progress(progress);
            },
            onLoadStop: (controller, url) {
              Provider.of<Google_provider>(context, listen: false)
                  .addurl(url.toString());
              pullrefreshcontroller.endRefreshing();
            },
            pullToRefreshController: pullrefreshcontroller,
          ),
          (Provider.of<Google_provider>(context, listen: true).progress < 1)
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: LinearProgressIndicator(
                    value: Provider.of<Google_provider>(context, listen: true)
                        .progress,
                  ),
                )
              : Container(),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed:() {
                Provider.of<Google_provider>(context,listen: false).goback();
              },
              icon: Icon(Icons.chevron_left)),
          IconButton(
              onPressed: () {Provider.of<Google_provider>(context,listen: false).goForward();
              },
              icon: Icon(Icons.chevron_right)),
          IconButton(
              onPressed: () {
                inAppWebViewController.reload();
              },
              icon: Icon(Icons.refresh)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.list)),
        ],
      ),
    );
  }
}
