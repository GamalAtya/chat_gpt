import 'package:chat_gpt/features/chat/data/data_sources/chat_remote_data_source.dart';
import 'package:chat_gpt/features/chat/domain/reporsitories/chat_repository.dart';
import 'package:chat_gpt/features/chat/domain/use_cases/send_message_useCase.dart';
import 'package:chat_gpt/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chat_gpt/features/welcome_screen/data/data_sources/welcome_local_data_source.dart';
import 'package:chat_gpt/features/welcome_screen/data/repositories/welcome_repo_impl.dart';
import 'package:chat_gpt/features/welcome_screen/domain/repositories/welcome_repository.dart';
import 'package:chat_gpt/features/welcome_screen/domain/use_cases/next_use_case.dart';
import 'package:chat_gpt/features/welcome_screen/presentation/bloc/welcome_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/chat/data/repositories/chat_repository_impl.dart';

final sl = GetIt.instance;


Future<void> init() async {
  // feature - welcome screen

     // bloc
    sl.registerFactory(() => WelcomeBloc(useCase: sl()));


    // use cases

  sl.registerLazySingleton(() => NextUseCase(welcomeRepository: sl()));

    // repository

  sl.registerLazySingleton<WelcomeRepository>(() => WelcomeRepositoryImpl(welcomeLocalDataSource: sl()));

    // datasource

   sl.registerLazySingleton<WelcomeLocalDataSource>(() => WelcomeLocalDataSourceImpl());



  // feature - chat

  //bloc

  sl.registerFactory(() => ChatBloc(sendMessageUseCase: sl()));

  //useCases

  sl.registerLazySingleton(() => SendMessageUseCase(chatRepository: sl()));



  //repository
  
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(networkInfo: sl() , remoteDateSource: sl()));


  //data source
  
  sl.registerLazySingleton<ChatRemoteDateSource>(() => ChatRemoteDataSourceImpl(client: sl()));






  //core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));


  //external

  final SharedPreferences preferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => preferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());


}