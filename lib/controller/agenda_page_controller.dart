import 'package:event_app_anacity/api/all_apis.dart';
import 'package:event_app_anacity/model/event_model.dart';
import 'package:event_app_anacity/shared/shared_prefs.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AgendaPageController extends GetxController {
  SharedPrefs sharedPrefs = SharedPrefs();

  ApiClass apiClass = ApiClass();

  RxList<EventModel> eventsList = RxList<EventModel>();

  RxBool isLoading = RxBool(true);

  RxList daysList = [].obs;

  var days = [];

  @override
  void onInit() async {
    super.onInit();

    final DateFormat formatter = DateFormat('EEEE MMMM d, yyyy');

    await apiClass
        .getAgenda(1)
        .then((value) => {
              eventsList(value),
              for (var i = 0; i < value.length; i++)
                {
                  if (!days.contains(value[i].day) && value[i].day != "")
                    {
                      daysList.add({
                        "dayNumber": value[i].day,
                        "date": formatter.format(value[i].date),
                      }),
                      days.add(value[i].day),
                    }
                }
            })
        .then((value) => isLoading(false));
  }
}
