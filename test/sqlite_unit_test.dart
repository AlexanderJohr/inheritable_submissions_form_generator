// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'dart:io';

import 'package:sqlite3/sqlite3.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test group', () {
    test('test', () {
      print('Using sqlite3 ${sqlite3.version}');

      // Create a new in-memory database. To use a database backed by a file, you
      // can replace this with sqlite3.open(yourFilePath).
      final db = sqlite3.openInMemory();

      // Create a table and insert some data
      db.execute('''
    CREATE TABLE artists (
      id INTEGER NOT NULL PRIMARY KEY,
      name TEXT NOT NULL
    );
  ''');

      // Prepare a statement to run it multiple times:
      final stmt = db.prepare('INSERT INTO artists (name) VALUES (?)');
      stmt
        ..execute(['The Beatles'])
        ..execute(['Led Zeppelin'])
        ..execute(['The Who'])
        ..execute(['Nirvana']);

      // Dispose a statement when you don't need it anymore to clean up resources.
      stmt.dispose();

      // You can run select statements with PreparedStatement.select, or directly
      // on the database:
      final ResultSet resultSet =
          db.select('SELECT * FROM artists WHERE name LIKE ?', ['The %']);

      // You can iterate on the result set in multiple ways to retrieve Row objects
      // one by one.
      for (final Row row in resultSet) {
        print('Artist[id: ${row['id']}, name: ${row['name']}]');
      }
      expect(resultSet[0]["id"], equals(1));
      expect(resultSet[0]["name"], equals("The Beatles"));
      
      expect(resultSet[1]["id"], equals(3));
      expect(resultSet[1]["name"], equals("The Who"));
      
      // Don't forget to dispose the database to avoid memory leaks
      db.dispose();
    });

    test('test', () {
      print('Using sqlite3 ${sqlite3.version}');

      // Create a new in-memory database. To use a database backed by a file, you
      // can replace this with sqlite3.open(yourFilePath).
      final db = sqlite3.openInMemory();

      // Register a custom function we can invoke from sql:
      db.createFunction(
        functionName: 'dart_version',
        argumentCount: const AllowedArgumentCount(0),
        function: (args) => Platform.version,
      );
      var result = db.select('SELECT dart_version()');

      expect(result[0]["dart_version()"], equals(Platform.version));
      // Don't forget to dispose the database to avoid memory leaks
      db.dispose();
    });
  });
}
