import 'package:ecomappv2/app/app_prefs.dart';
import 'package:ecomappv2/data/data_source/remote_data_source.dart';
import 'package:ecomappv2/data/network/dio_factory.dart';
import 'package:ecomappv2/data/network/network_shelf.dart';
import 'package:ecomappv2/data/repository/repository_impl.dart';
import 'package:ecomappv2/domain/domain_shelf.dart';
import 'package:ecomappv2/presentation/view/login/login_shelf.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  //SP
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  //AP
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(sharedPreferences: instance<SharedPreferences>()));
  //DF
  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(appPreferences: instance()));
  //Remote Data Source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(appServiceClient: instance()));
  //Repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(remoteDataSource: instance()));
  //AS
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(repository: instance()));
    instance.registerLazySingleton<LoginViewModel>(
        () => LoginViewModel(instance()));
  }
}
