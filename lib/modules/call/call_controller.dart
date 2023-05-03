import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/user/person_response.dart';
import 'package:healthcare_app_doctor/repository/user.repository.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:healthcare_app_doctor/service/socket_service.dart';

class CallController extends GetxController {
  Rx<bool> isReceiver = false.obs;
  var socketService = Get.find<SocketService>();
  final userRepository = Get.find<UserRepository>();
  PersonPatientResponse? patient;
  RxString fullNameCaller = "".obs;
  RxString fullNameCallee = "".obs;
  @override
  void onInit() {
    initPerson();
    super.onInit();
    isReceiver.value = Get.arguments;
  }

  void acceptVideo() async {
    // socketService.socket.onConnect((data) {

    socketService.socket.emit('acceptCall', {
      "conversationId": LocalStorageService.getConversationCallId(),
      "callerId": LocalStorageService.getCallerId(),
      "calleeId": LocalStorageService.getId()
    });
    Get.offNamed(AppRoutes.CALL_VIDEO_PAGE);
    // });
  }

  void refuseVideo() async {
    // socketService.socket.onConnect((data) {

    socketService.socket.emit('rejectCall', {
      "conversationId": LocalStorageService.getConversationCallId(),
      "callerId": LocalStorageService.getCallerId(),
      "calleeId": LocalStorageService.getId()
    });
    Get.back();
    // });
  }

  void cancelVideo() async {
    // socketService.socket.onConnect((data) {

    socketService.socket.emit('cancelCall', {
      "conversationId": LocalStorageService.getConversationCallId(),
      "callerId": LocalStorageService.getId(),
      "calleeId": LocalStorageService.getCalleeId()
    });
    Get.back();
    // });
  }

  void initPerson() async {
    await userRepository.getPerson(LocalStorageService.getCallerId()).then(
        (value) => fullNameCaller.value = value.data?.patient?.fullName! ?? "");
    fullNameCallee.value = LocalStorageService.getCallName();
    // await userRepository.getPerson(LocalStorageService.getCalleeId()).then(
    //     (value) => fullNameCallee.value = value.data?.patient?.fullName! ?? "");
  }
}
