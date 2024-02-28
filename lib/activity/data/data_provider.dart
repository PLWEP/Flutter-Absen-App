import 'package:absen_app/activity/data/datasource/activity_remote_datasource.dart';
import 'package:absen_app/activity/data/datasource/activity_storage_datasource.dart';
import 'package:absen_app/activity/data/repository/activity_repository_impl.dart';
import 'package:absen_app/activity/data/repository/pdf_repository.dart';
import 'package:absen_app/common/firebase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/pdf.dart';

final activityRemoteDataSourceProvider = Provider(
  (ref) => ActivityRemoteDatasource(
    firestore: ref.watch(firestoreProvider),
  ),
);

final activityStorageDataSourceProvider = Provider(
  (ref) => ActivityStorageDatasource(
    storage: ref.watch(storageProvider),
  ),
);

final activityRepositoryProvider = Provider(
  (ref) => ActivityRepositoryImpl(
    activityRemoteDatasource: ref.watch(activityRemoteDataSourceProvider),
    activityStorageDatasource: ref.watch(activityStorageDataSourceProvider),
  ),
);

final pdfRepositoryProvider = Provider(
  (ref) => PDFRepository(baseColor: PdfColors.white),
);
