import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _quotes;
  String? _author;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _getQuotes() async {
    try {
      var url = Uri.parse('https://api.quotable.io/random');
      var response = await http.get(url);
      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      var data = jsonDecode(response.body);
      setState(() {
        _quotes = data["content"];
        _author = data["author"];
        _isLoading = false;
      });
    } catch (error) {
      // Handle error, e.g., show an error message
      debugPrint('Error fetching quotes: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink.shade200,
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: IntrinsicHeight(
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _buildQuoteContainer(),
                ),
              ),
              _buildGenerateButton(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.pinkAccent.shade700,
      toolbarHeight: 60.h,
      title: Text(
        "Random Quotes",
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildQuoteContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink.shade400,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              _quotes ?? "😃Click 'Generate' for quotes😃",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: .4,
              ),
            ),
          ),
          if (_quotes != null) // Only show the Row if quotes are not null
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: InkWell(
                      onTap: () {
                        Share.share("$_quotes\n\n Author:  $_author");
                      },
                      child: Icon(Icons.share,color: Colors.white,size: 24.sp,)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 15.h, left: 30.w, bottom: 10.h),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "-$_author",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildGenerateButton() {
    return Padding(
      padding: EdgeInsets.only(top: 80.h),
      child: Center(
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                _getQuotes().then((_) {
                  setState(() {
                    _isLoading = false;
                  });
                });
              },
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r))),
                  fixedSize: MaterialStatePropertyAll(Size(200.w, 40.h)),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.white)),
              child: Text(
                "Generate",
                style: GoogleFonts.poppins(
                    color: Colors.pink,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp),
              ))),
    );
  }
}
