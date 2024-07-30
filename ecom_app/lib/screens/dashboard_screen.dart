import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String uname = "";
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    uname = await prefs.getString('uname') ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        child: Text('Welcome $uname'),
      ),
    );
  }
}
