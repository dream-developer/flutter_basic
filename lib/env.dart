import 'package:envied/envied.dart'; // 1 

part 'env.g.dart'; // 2

@Envied(path: '.env') // 3
abstract class Env {
  @EnviedField(varName: 'API_KEY', obfuscate: true) // 4
  static final String apikey = _Env.apikey; // 5
}