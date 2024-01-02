import 'package:ttnflix/di/service_locator.dart';
import 'package:ttnflix/di/service_locator_impl.dart';
import 'package:ttnflix/network/api_client.dart';
import 'package:ttnflix/network/api_service.dart';

class AppModule {
  Future<void> initialise() async {
    // Initialise service provider
    ServiceLocatorImpl().initialise();
    final serviceLocator = ServiceLocator.ttnFlixServiceLocator;

    // Api Service
    if (!serviceLocator.isRegistered<ApiService>()) {
      serviceLocator.registerSingleton(ApiService());
    }

    // Api Http Client
    if (!serviceLocator.isRegistered<ApiClient>()) {
      serviceLocator.registerSingleton(ApiClient());
    }
  }
}
