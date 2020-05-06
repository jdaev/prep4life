import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:prep4life/services/firestore_database.dart';
import 'package:prep4life/services/firebase_auth_service.dart';

class MockAuthService extends Mock implements FirebaseAuthService {}

class MockDatabase extends Mock implements FirestoreDatabase {}

class MockWidgetsBinding extends Mock implements WidgetsBinding {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}
