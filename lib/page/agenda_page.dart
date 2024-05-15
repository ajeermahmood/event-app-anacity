import 'package:event_app_anacity/controller/agenda_page_controller.dart';
import 'package:event_app_anacity/model/event_model.dart';
import 'package:event_app_anacity/widgets/app_bar_widget.dart';
import 'package:event_app_anacity/widgets/drawer_widget.dart';
import 'package:event_app_anacity/widgets/event_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgendaPage extends GetView<AgendaPageController> {
  const AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AgendaPageController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: getAppBar(scaffoldKey),
        drawer: DrawerWidget(),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const EventLogoWidget(pageName: "AGENDA"),
                    TabBar(
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelPadding: const EdgeInsets.all(3),
                      tabs: controller.daysList
                          .map(
                            (day) => Tab(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                          'DAY ${day['dayNumber']} - ${day['date']}'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: TabBarView(
                        children: controller.daysList.map((day) {
                          List<EventModel> filteredEvents = controller
                              .eventsList
                              .where((event) => event.day == day['dayNumber'])
                              .toList();

                          return SingleChildScrollView(
                            child: DataTable(
                              dataRowColor:
                                  MaterialStateProperty.all(Colors.blue[50]),
                              dividerThickness: 2,
                              columnSpacing: 5,
                              dataRowMaxHeight: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey[500],
                              ),
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Expanded(
                                    child: Text(
                                      'Time',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              rows: filteredEvents
                                  .map(
                                    (event) => DataRow(
                                      cells: [
                                        DataCell(
                                          SizedBox(
                                            width: 120,
                                            child: Text(event.time),
                                          ),
                                        ),
                                        DataCell(
                                          SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(event.topic),
                                                event.speakerName != ""
                                                    ? Column(
                                                        children: [
                                                          const SizedBox(
                                                              height: 5),
                                                          Text(
                                                            event.speakerName,
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
