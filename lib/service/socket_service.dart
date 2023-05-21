import 'package:get/get.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService extends GetxService {
  late IO.Socket socket;
String domain = "http://10.0.2.2:5000";
  // String domain = "https://healthcarebe-production.up.railway.app";
  void connect() {
    try {

      socket = IO.io(domain, <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": false,
        "query": "Authorization=${LocalStorageService.getRefreshToken()}"
      });

      socket.connect();
    } catch (e) {
    }
  }

  @override
  void onInit() {

    super.onInit();
    connect();
  }

  @override
  void onClose() {
    socket.disconnect();
    super.onClose();
  }
}
