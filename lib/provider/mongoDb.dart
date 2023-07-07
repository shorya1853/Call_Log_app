import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class MongoCurdNotifier extends StateNotifier<List<Object>>{
  MongoCurdNotifier(): super([]);
  
  

}


final call_description = FutureProvider((ref) {
  return MongoCurdNotifier();
});