import 'package:chat_app/core/api_services/add_api_services.dart';
import 'package:chat_app/core/api_services/auth_api_services.dart';
import 'package:chat_app/core/api_services/fetch_api_services.dart';
import 'package:chat_app/features/auth/data/repo/auth_repo.dart';
import 'package:chat_app/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:chat_app/features/chats/data/repo/add_chats_data_repo.dart';
import 'package:chat_app/features/chats/data/repo/get_chats_data_repo.dart';
import 'package:chat_app/features/chats/presentation/view_model/add_chats_data_cubit.dart';
import 'package:chat_app/features/chats/presentation/view_model/get_chats_data_cubit.dart';
import 'package:chat_app/features/show_contact/data/repo/show_contact_repo.dart';
import 'package:chat_app/features/show_contact/presentation/view_model/show_contact_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUpGet() async {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Register services
  getIt.registerLazySingleton<AuthServices>(() => AuthServices(firebaseAuth));
  getIt.registerLazySingleton<FetchApiServices>(() => FetchApiServices(firebaseFirestore));
  getIt.registerLazySingleton<AddApiServices>(() => AddApiServices(firebaseFirestore));

  // Show Contact
  getIt.registerLazySingleton<ShowContactRepo>(() => ShowContactRepo(getIt()));
  getIt.registerLazySingleton<ShowContactCubit>(() => ShowContactCubit(getIt()));

  // Authentication
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt(), getIt()));
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));

  // Add Chats Data
  getIt.registerLazySingleton<AddChatsDataRepo>(() => AddChatsDataRepo(getIt()));
  getIt.registerLazySingleton<AddChatsDataCubit>(() => AddChatsDataCubit(getIt()));

  // Get Chats Data
  getIt.registerLazySingleton<GetChatsDataRepo>(() => GetChatsDataRepo(getIt()));
  getIt.registerLazySingleton<GetChatsDataCubit>(() => GetChatsDataCubit(getIt()));
}
