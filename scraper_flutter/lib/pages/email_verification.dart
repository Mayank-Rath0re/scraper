import 'package:flutter/material.dart';
import 'package:scraper_client/scraper_client.dart';
import 'package:scraper_flutter/components/abs_box.dart';
import 'package:scraper_flutter/components/abs_button.dart';
import 'package:scraper_flutter/components/abs_email_verbox.dart';
import 'package:scraper_flutter/main.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  List<DBEmail> emailBuild = [];
  List<DBEmail> tempBuild = [];
  int currentPage = 0;
  bool hasMore = true;

  Future<void> getEmailData() async {
    try {
      List<DBEmail> emailData =
          await client.email.retrieveAll(limit: 30, offset: currentPage);
      setState(() {
        emailBuild = emailData;
      });
    } catch (err) {
      setState(() {
        emailBuild = [];
      });
    }
  }

  Future<void> refresh() async {
    List<int> ids = [];
    for (int i = 0; i < emailBuild.length; i++) {
      ids.add(emailBuild[i].id ?? 0);
    }
    tempBuild = await client.email.retrieveSelected(ids);
    ids = [];
    setState(() {
      emailBuild = tempBuild;
      tempBuild = [];
    });
  }

  void loadMore() async {
    tempBuild = await client.email.retrieveAll(limit: 30, offset: currentPage);
    setState(() {
      emailBuild.addAll(tempBuild);
      currentPage++;
      hasMore = tempBuild.length == 30;
      tempBuild = [];
    });
  }

  @override
  void initState() {
    getEmailData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: AbsBox(color: Colors.grey, text: "Scraper ID"),
              ),
              const SizedBox(width: 10),
              Expanded(child: AbsBox(color: Colors.grey, text: "Status")),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: AbsBox(color: Colors.grey, text: "Activity Log"))
            ],
          ),
          const SizedBox(height: 10),
          if (emailBuild.isEmpty) ...[
            Center(child: Text("No Available Processes"))
          ] else ...[
            for (int i = currentPage * 30; i < emailBuild.length; i++) ...[
              AbsEmailVerbox(emailProcess: emailBuild[i]),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 20),
            Row(
              children: [
                AbsButton(
                    text: "Previous Page",
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      if (currentPage > 0) {
                        currentPage--;
                        refresh();
                      }
                    }),
                const Spacer(),
                AbsButton(
                    text: "Next Page",
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {
                      if ((currentPage + 1) * 30 < emailBuild.length) {
                        loadMore();
                        if ((currentPage + 1) * 30 < emailBuild.length) {
                          // Do nothing
                        } else {
                          refresh();
                        }
                      } else {
                        currentPage++;
                        refresh();
                      }
                    })
              ],
            )
          ]
        ],
      ),
    );
  }
}
