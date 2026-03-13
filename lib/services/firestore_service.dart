import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/station.dart';

class FirestoreService {
  final FirebaseFirestore _db;

  FirestoreService()
      : _db = FirebaseFirestore.instanceFor(
            app: Firebase.app(), databaseId: 'stations31') {
    _db.settings = const Settings(persistenceEnabled: true);
  }

  // Add station
  Future<void> addStation(Station station) async {
    await _db.collection('stations').add(station.toMap());
  }

  // Edit station
  Future<void> updateStation(Station station) async {
    await _db.collection('stations').doc(station.id).update(station.toMap());
  }

  // Delete station
  Future<void> deleteStation(String stationId) async {
    await _db.collection('stations').doc(stationId).delete();
  }

  // Stream of stations for a specific owner
  Stream<List<Station>> getStationsByOwner(String ownerId) {
    // Re-added the filter so each admin ONLY sees their own stations
    return _db
        .collection('stations')
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Station.fromMap(doc.id, doc.data()))
            .toList());
  }

  // Stream of all stations (if needed for grand admin, but mostly we filter by owner)
  Stream<List<Station>> getAllStations() {
    return _db.collection('stations').snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Station.fromMap(doc.id, doc.data()))
        .toList());
  }
}
