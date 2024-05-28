import 'package:flutter/material.dart';
import 'add_member_screen.dart';
import 'member_details_screen.dart';

class MembersScreen extends StatefulWidget {
  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  final List<Member> members = [
    Member(
      name: 'Member 1',
      email: 'member1@example.com',
      profileImageUrl: 'assets/avatar.jpg',
    ),
    Member(
      name: 'Member 2',
      email: 'member2@example.com',
      profileImageUrl: 'assets/avatar.jpg',
    ),
    // Ajoutez plus de membres ici
  ];

  void _addMember(Map<String, String> memberData) {
    setState(() {
      members.add(Member(
        name: memberData['name']!,
        email: memberData['email']!,
        profileImageUrl: memberData['profileImageUrl']!,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adhérents'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddMemberScreen(),
                ),
              );
              if (result != null) {
                _addMember(result);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(member.profileImageUrl),
            ),
            title: Text(member.name),
            subtitle: Text(member.email),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetailScreen(member: member),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Member {
  final String name;
  final String email;
  final String profileImageUrl;

  Member({
    required this.name,
    required this.email,
    required this.profileImageUrl,
  });
}
