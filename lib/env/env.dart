import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final apiUrl = _Env.apiUrl;

  @EnviedField(varName: 'LOGIN_URL', obfuscate: true)
  static final loginUrl = _Env.loginUrl;


  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final apiKey = _Env.apiKey;

  @EnviedField(varName: 'CLIENT_ID', obfuscate: true)
  static final clientId = _Env.clientId;

  @EnviedField(varName: 'APP_VERSION', obfuscate: true)
  static final appVersion = _Env.appVersion;

  @EnviedField(varName: 'APP_PLATFORM', obfuscate: true)
  static final appPlatform = _Env.appPlatform;

  @EnviedField(varName: 'CLIENT', obfuscate: true)
  static final appClient = _Env.appClient;

  @EnviedField(varName: 'USERNAME', obfuscate: true)
  static final username = _Env.username;

  @EnviedField(varName: 'PASSWORD', obfuscate: true)
  static final password = _Env.password;
}
