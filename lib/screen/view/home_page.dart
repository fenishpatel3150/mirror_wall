import 'package:flutter/material.dart';
import 'package:mirror_wall/screen/provider/Google_Provider.dart';
import 'package:mirror_wall/screen/view/Crome_screen.dart';
import 'package:provider/provider.dart';


TextEditingController txtsearch =TextEditingController();


class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                  width: 180,
                  child:
                  Image.asset('assets/image1.png',)),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: Container(
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius:25
                        )
                      ]
                  ),
                  child: TextFormField(
                    controller: txtsearch,
                    decoration: InputDecoration(
                        hintText: 'Search....',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => const Chrome_Screen(),));
                              Provider.of<Google_provider>(context,listen: false).Search(txtsearch.text);
                              },
                            icon:  const Icon(Icons.search)),
                        contentPadding:  const EdgeInsets.symmetric(horizontal: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none)),
                  ),
                ),
              ),
              Image.asset('assets/image2.png')
            ],
          ),
        ),
      ),
    );
  }
}