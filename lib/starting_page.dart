import 'package:final_project/core/shared_pref/shared_pref.dart';
import 'package:final_project/features/dashboard/dashboard_page.dart';
import 'package:final_project/features/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {

  @override
  void initState() {
    // TODO: implement initState
    handleRouting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Column(

        )
    );
  }

  ////outside the widget build

   Future<void> handleRouting() async{

    final hasSeenOnboarding = await SharedPref.getOnboardingStatus();
     if(!hasSeenOnboarding) {
       //user hasnt seen onboarding yet,so show it

       Navigator.pushReplacement(context,

           MaterialPageRoute(builder: (context) => OnBoardingPage()));

       await
       SharedPref.saveOnboardingStatus(true);
     }
     else {
       //user has seen onboarding, so show the main app
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => DashboardPage()));

     }
     }
   }

