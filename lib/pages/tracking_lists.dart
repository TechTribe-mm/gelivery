import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gelivery/providers/login_provider.dart';
import 'package:gelivery/repository/api_routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TrackingLists extends StatefulWidget {
  static const routes = '/pickup';
  const TrackingLists({super.key});

  @override
  State<TrackingLists> createState() => _TrackingListsState();
}

class _TrackingListsState extends State<TrackingLists> {
  List<dynamic> dataItems = [];
  int page = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  logout(provider) {
    provider.revokeToken();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('access_token');

    try {
      var response = await http.post(
        Uri.parse(dataUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken"
        },
        body: jsonEncode({
          "first": page,
          "max": 10,
        }),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        setState(() {
          dataItems.addAll(jsonResponse['data']['items']);
          page++;
        });
      } else {
        _showError('Failed to load data');
      }
    } catch (e) {
      _showError('An error occurred: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    // final trackingListProvider = Provider.of<TrackingProvider>(context);
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout(loginProvider),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: ListView.builder(
          itemCount: dataItems.length + 1,
          itemBuilder: (context, index) {
            if (index == dataItems.length) {
              return isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink();
            }

            var item = dataItems[index];
            return ListTile(
              title: Text('Tracking ID: ${item['trackingId']}'),
              subtitle: Text('Sender: ${item['osName']}'),
            );
          },
        ),
      ),
    );
  }
}
