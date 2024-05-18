// ignore: file_names
// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:GiveAID/Models/acc_org_gal.dart';
import 'package:GiveAID/Models/account.dart';
import 'package:GiveAID/Models/gallery.dart';
import 'package:GiveAID/Models/organization.dart';
import 'package:http/http.dart' as http;

class APIServices {
  var url = 'https://192.168.1.13:7001/api';

  //ACCOUNTS
  Future<List<Account>> fetchAccount() async {
    final response = await http.get(Uri.parse('$url/Account'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Account>((json) => Account.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Account');
    }
  }

  Future<AccOrgGal> fetchAccountOrganizationGallery(idA) async {
    final response = await http.get(Uri.parse('$url/Account/$idA'));
    if (response.statusCode == 200) {
      return AccOrgGal.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Account Organization Gallery');
    }
  }

  //ORGANIZATION_PROGRAM
  Future<List<Organizations>> fetchOrganization() async {
    final response = await http.get(Uri.parse('$url/Organization_program'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<Organizations>((json) => Organizations.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load Org');
    }
  }

  Future<Organizations> fetchOrgDetails(idO) async {
    final response =
        await http.get(Uri.parse('$url/Organization_program/$idO'));
    if (response.statusCode == 200) {
      return Organizations.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Org Details');
    }
  }

  //GALLERY
  Future<List<Galleries>> fetchGallery() async {
    final response = await http.get(Uri.parse('$url/Gallery'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Galleries>((json) => Galleries.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Gal');
    }
  }
}
