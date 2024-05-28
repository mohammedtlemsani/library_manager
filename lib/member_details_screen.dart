import 'package:flutter/material.dart';

import 'members_screen.dart';

class MemberDetailScreen extends StatelessWidget {
  final Member member;

  MemberDetailScreen({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'adhérent'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(member.profileImageUrl),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nom : ${member.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Email : ${member.email}',
              style: TextStyle(fontSize: 18),
            ),
            // Ajoutez d'autres informations pertinentes ici
          ],
        ),
      ),
    );
  }
}


