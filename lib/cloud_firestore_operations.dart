import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatelessWidget {
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firestore CRUD Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Add User'),
                onPressed: () {
                  addUser();
                },
              ),
              ElevatedButton(
                child: Text('Get Users'),
                onPressed: () {
                  getUsers();
                },
              ),
              ElevatedButton(
                child: Text('Update User'),
                onPressed: () {
                  updateUser();
                },
              ),
              ElevatedButton(
                child: Text('Delete User'),
                onPressed: () {
                  deleteUser();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addUser() {
    return usersCollection
        .add({
      'name': 'Chris Evans',
      'email': 'chris@example.com',
    })
        .then((value) => print('User added'))
        .catchError((error) => print('Failed to add user: $error'));
  }

  Future<void> getUsers() {
    return usersCollection.get().then((snapshot) {
      for (var doc in snapshot.docs) {
        print(doc.data());
      }
    }).catchError((error) => print('Failed to get users: $error'));
  }

  Future<void> updateUser() {
    return usersCollection
        .doc('DOCUMENT_ID') // Replace 'DOCUMENT_ID' with the actual document ID
        .update({'name': 'Chris Evans Avengers'})
        .then((value) => print('User updated'))
        .catchError((error) => print('Failed to update user: $error'));
  }

  Future<void> deleteUser() {
    return usersCollection
        .doc('DOCUMENT_ID') // Replace 'DOCUMENT_ID' with the actual document ID
        .delete()
        .then((value) => print('User deleted'))
        .catchError((error) => print('Failed to delete user: $error'));
  }
}
