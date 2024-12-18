import 'package:chat_app/core/api_services/add_api_services.dart';
import 'package:chat_app/core/api_services/auth_api_services.dart';
import 'package:chat_app/core/api_services/fetch_api_services.dart';
import 'package:chat_app/features/auth/data/repo/auth_repo.dart';
import 'package:chat_app/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:chat_app/features/chats/data/repo/add_chats_data_repo.dart';
import 'package:chat_app/features/chats/presentation/view_model/add_chats_data_cubit.dart';
import 'package:chat_app/features/show_contact/data/repo/show_contact_repo.dart';
import 'package:chat_app/features/show_contact/presentation/view_model/show_contact_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
GetIt getIt1 = GetIt.instance;
GetIt getIt2 = GetIt.instance;
 Future<void>setUpGet()async{
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  getIt.registerLazySingleton<AuthServices>(()=>AuthServices(firebaseAuth));
  
   getIt1.registerLazySingleton<FetchApiServices>(()=>FetchApiServices(firebaseFirestore));
   getIt2.registerLazySingleton<AddApiServices>(()=>AddApiServices( firebaseFirestore));

   ///show contact
  getIt1.registerLazySingleton<ShowContactRepo>(()=>ShowContactRepo(getIt1()));
  getIt1.registerLazySingleton<ShowContactCubit>(()=>ShowContactCubit(getIt1())); 
 
  
///authentication
  getIt.registerLazySingleton<AuthRepo>(()=>AuthRepo(getIt()));
  getIt.registerLazySingleton<AuthCubit>(()=>AuthCubit(getIt()));
  
  ///add chatsData
  getIt2.registerLazySingleton<AddChatsDataRepo>(()=>AddChatsDataRepo(getIt2()));
  getIt2.registerLazySingleton<AddChatsDataCubit>(()=>AddChatsDataCubit(getIt2()));

 }