import 'package:flutter/material.dart';
import 'package:scraper_flutter/components/abs_dashboard_widget.dart';
import 'package:scraper_flutter/main.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<int> metrics = [0, 0, 0, 0];

  void getData() async {
    try {
      List<int> boardData = await client.scrape.dashboardData();
      setState(() {
        metrics = boardData;
      });
    } catch (err) {
      setState(() {
        metrics = [0, 0, 0, 0];
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AbsDashboardWidget(
                widgetTitle: "Scrapers",
                displayData: "${metrics[0]}/${metrics[1]}"),
            const SizedBox(width: 30),
            AbsDashboardWidget(
              widgetTitle: "Database",
              displayData: "${metrics[2]}/${metrics[3]}",
            ),
          ],
        ),
      ),
    );
  }
}
