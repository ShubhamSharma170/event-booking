// ignore_for_file: file_names

import 'package:event_booking/model/event-model.dart';
import 'package:event_booking/services/api-services.dart';
import 'package:flutter/material.dart';

class APICall extends ChangeNotifier {
  List<EventModel> eventData = [];
  // get
  getEventData() => eventData;

  setEventData(List<EventModel> data) {
    eventData = data;
    notifyListeners();
  }

  // function for get event api data
  Future<void> getEventApiData() async {
    List<EventModel> data = await APIClass().getPostData();
    setEventData(data);
    notifyListeners();
  }
}
