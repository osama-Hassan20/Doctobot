import 'package:flutter/material.dart';


class TermsOfService extends StatefulWidget {


  @override
  _TermsOfServiceState createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {





    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Service'),
      ),
      body: SingleChildScrollView(
        child: Center(
            child:  Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 10,),
              Text(
                  'Thank you for using DoctBot. Your trust is important to us and we are committed to protecting the privacy and security of your personal information. The information you shared with us helps us to provide a great experience with DoctBot. This Privacy Policy describes our privacy practices for all Services we offer worldwide. The term “DoctBot”, “us” or “we” refer to DoctBot LLC and the term “User”, “you”, “yours” refer to yourself as the User of DoctBot\'s Services This Privacy Policy, together with the Terms of Use, set forth the general rules and policies governing your use of our platform. Depending on your activities when visiting our platform, you may be required to agree to additional terms and conditions',
              ),
                  SizedBox(height: 30,),
                  Text(
                    '1.1. Doctobot is committed to maintaining privacy protections for its Users. Our Privacy Policy is designated to help you understand how we collect, use and safeguard the information you provide to us. When you visit Doctobot, we automatically collect certain information about your device, including information about your web browser, IP address, time zone, and some of the cookies that are installed on your device. Additionally, as you browse the Site, we collect information about the individual web pages or doctors that you view, what websites or search terms referred you to Doctobot, and information about how you interact with Doctobot.',
                  ),
                  SizedBox(height: 10,),

                  Text(
                    '1.2. We also collect information from you when you register on Doctobot’s Website, book a doctor’s appointment or subscribe to our newsletter. When booking or registering on our Website, as appropriate, you may be asked to enter your name, e-mail address, mailing address, phone number, and date of birth (“Personal Information”).',
                  ),
                  SizedBox(height: 10,),

                  Text(
                    '1.3. We may also request that you provide us with information to collect payment from your credit or debit card. After a transaction, this private information (credit cards, social security numbers, financial data, etc.) will not be stored on our servers.',
                  ),
                  SizedBox(height: 10,),

                  Text(
                    '1.4. You may request that we delete this information at any time, or unsubscribe from emails through your account settings or by following the detailed instructions at the bottom of each email.',
                  ),

                ]
              ),
            )),
      ),
    );
  }
}