import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListingServices{
  Future fetchDocumentRequestListFromUrl(String search) async {
    // CustomerList? custom erList;
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();
    final response = await http.get(
        Uri.parse("https://api-rdms.sooritechnology.com.np/api/asset-app/request-asset-master"),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${prefs.getString("access_token")}'
        });
    log(response.body);
    log(response.statusCode.toString());
    try {
      if (response.statusCode == 200) {
        return response.body;
      }

    } catch (e) {
      throw Exception(e);
    }
  }
}