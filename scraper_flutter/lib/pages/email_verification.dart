import 'package:flutter/material.dart';
import 'package:scraper_client/scraper_client.dart';
import 'package:scraper_flutter/components/abs_box.dart';
import 'package:scraper_flutter/components/abs_email_verbox.dart';
import 'package:scraper_flutter/main.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  List<DBEmail> emailBuild = [];

  Future<void> getEmailData() async {
    try {
      List<DBEmail> emailData = await client.email.retrieveAll();
      setState(() {
        emailBuild = emailData;
      });
    } catch (err) {
      setState(() {
        emailBuild = [];
      });
    }
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
            for (int i = 0; i < emailBuild.length; i++) ...[
              AbsEmailVerbox(emailProcess: emailBuild[i]),
              const SizedBox(height: 10),
            ]
          ]
        ],
      ),
    );
  }
}
