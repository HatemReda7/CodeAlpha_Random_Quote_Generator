import 'package:codealpha_random_quote_generator/Shared/Remote/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80.h,
        title: Text(
          'Random Quote Generator',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                // getQuote();
              },
              child: const Text("Generate Quote!")),
          FutureBuilder(
              future: ApiManager.getQuote(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  var error = snapshot?.error;
                  print(error);
                  return const Center(child: Text("Something went wrong!"));
                }
                var category = snapshot.data?.category ?? "";
                var quote = snapshot.data?.quote ?? "Hatem";
                var author = snapshot.data?.author ?? "";
                return Center(
                  child: Container(
                    width: 300.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "category",
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                        Text(
                          quote,
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                        Text(
                          author,
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }

// Widget getQuote() {
//   return FutureBuilder(
//       future: ApiManager.getQuote(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return const Center(child: Text("Something went wrong!"));
//         }
//         var category = snapshot.data?.category ?? "";
//         var quote = snapshot.data?.quote ?? "";
//         var author = snapshot.data?.author ?? "";
//         return Card(
//           child: Column(
//             children: [
//               Text("$category"),
//               Text("$quote"),
//               Text("$author"),
//             ],
//           ),
//         );
//       });
// }
}
