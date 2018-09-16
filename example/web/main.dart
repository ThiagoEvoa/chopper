import 'package:angular/angular.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_example/angular_example.dart';
import 'package:http/http.dart' as http;
import 'package:http/browser_client.dart';

// ignore: uri_has_not_been_generated
import 'main.template.dart' as ng;

ChopperClient chopperClientFactory(http.Client httpClient) => ChopperClient(
      jsonApi: true,
      baseUrl: 'http://localhost:9000',
      client: httpClient,
    );

@GenerateInjector([
  ClassProvider<http.Client>(http.Client, useClass: BrowserClient),
  FactoryProvider<ChopperClient>(ChopperClient, chopperClientFactory),
])
final InjectorFactory chopperApp = ng.chopperApp$Injector;

void main() => runApp(
      appFactory,
      createInjector: chopperApp,
    );
