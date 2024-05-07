// ignore: file_names
// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:GiveAID/Models/account.dart';
import 'package:http/http.dart' as http;

class APIServices {
  var url = 'https://192.168.1.37:7001/api';

  //ACCOUNTS
  Future<List<Account>> fetchAccount() async {
    final response =
        await http.get(Uri.parse('$url/Account'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Account>((json) => Account.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Account');
    }
  }

  Future<Account> fetchAccountDetails(idA) async {
    final response =
        await http.get(Uri.parse('$url/Account/$idA'));
    if (response.statusCode == 200) {
      return Account.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Account Details');
    }
  }
}
