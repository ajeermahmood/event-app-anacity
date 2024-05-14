import 'package:get/get.dart';
import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/model/event.dart';

class EventController extends GetxController with StateMixin {
  EventController();

  ApiClass apiClass = ApiClass();

  Rxn<EventModel> eventDetails = Rxn<EventModel>();

  @override
  void onInit() async {
    super.onInit();
    await apiClass.getEventDetails().then((value) => eventDetails(value));
    change(null, status: RxStatus.success());
  }
}
