import 'package:flutter/material.dart';
import 'package:scraper_flutter/pages/dashboard.dart';
import 'package:scraper_flutter/pages/email_verification.dart';
import 'package:scraper_flutter/pages/extraction.dart';
import 'package:scraper_flutter/pages/queries.dart';
import 'package:scraper_flutter/pages/scrapers.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: "Dashboard"),
              Tab(text: "Scrapers"),
              Tab(text: "Queries"),
              Tab(text: "Email Verification"),
              Tab(text: "Extraction")
            ]),
        body: TabBarView(children: [
          Center(child: Dashboard()),
          Center(child: Scrapers()),
          Center(child: Queries()),
          Center(child: EmailVerification()),
          Center(child: Extraction())
        ]),
      ),
    );
  }
}
