import 'package:get/get.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService extends GetxService {
  late IO.Socket socket;

  void connect() {
    try {
      print('Authorization: ${LocalStorageService.getRefreshToken()}');

      socket = IO.io('http://10.0.2.2:5000', <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": false,
        "query": "Authorization=${LocalStorageService.getRefreshToken()}"
      });

      socket.connect();
    } catch (e) {
      print('Error connecting to Socket.io server: $e');
    }
  }

  @override
  void onInit() {
    print('Authorization123123: ${LocalStorageService.getRefreshToken()}');

    super.onInit();
    connect();
  }

  @override
  void onClose() {
    socket.disconnect();
    super.onClose();
  }
}
