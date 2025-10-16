import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/service_model.dart';
import 'service_remote_datasource.dart';

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final FirebaseFirestore firestore;

  ServiceRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<ServiceModel>> getServices() async {
    final querySnapshot = await firestore.collection('services').get();
    return querySnapshot.docs
        .map((doc) => ServiceModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  @override
  Future<ServiceModel?> getServiceDetail(String serviceId) async {
    final doc = await firestore.collection('services').doc(serviceId).get();
    if (doc.exists) {
      return ServiceModel.fromMap(doc.data()!, doc.id);
    }
    return null;
  }

  @override
  Future<void> addService(ServiceModel service) async {
    await firestore.collection('services').add(service.toMap());
  }

  @override
  Future<void> updateService(ServiceModel service) async {
    await firestore.collection('services').doc(service.id).update(service.toMap());
  }

  @override
  Future<void> deleteService(String serviceId) async {
    await firestore.collection('services').doc(serviceId).delete();
  }
}
