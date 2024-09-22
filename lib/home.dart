import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gpt_practice/user.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  void fetchUsers() async {
    const String url = "https://randomuser.me/api/?results=15";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final data = json.decode(response.body);
    print("Data is $data");
    final List<dynamic> results = data['results'];

    users = results.map((userJson) => User.fromJson(userJson)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Practice'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length, // Количество элементов в списке
        itemBuilder: (context, index) {
          final user = users[index]; // Получаем пользователя по индексу
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(user.pictureUrl), // Фото пользователя
            ),
            title: Text(user.name), // Имя пользователя
            subtitle: Text(
                '${user.email}\n${user.location.street}, ${user.location.country}'), // Email и местоположение
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
