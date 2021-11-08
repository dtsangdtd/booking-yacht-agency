import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/core/models/customer_model.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  Rx<BusinessTour> selectedBusinessTour = BusinessTour().obs;
  Rx<Trip> selectedTrip = Trip().obs;
  RxMap<String, List<Customer>> ticketTypesMap =
      RxMap<String, List<Customer>>();

  initTicketTypesMap() {
    ticketTypesMap.clear();
  }

  int countCustomer(String id) {
    List<Customer> customers = ticketTypesMap[id] ?? [];
    return customers.length;
  }

  removeLastCustomer(String id) {
    List<Customer> customers = ticketTypesMap[id] ?? [];
    if (customers.isNotEmpty) {
      customers.removeLast();
    }
    ticketTypesMap[id] = customers;
  }

  addCustomer(String id, Customer customer) {
    List<Customer> customers = ticketTypesMap[id] ?? [];
    customers.add(customer);
    ticketTypesMap[id] = customers;
  }

  List<Customer> getCustomers(String id) {
    List<Customer> customers = ticketTypesMap[id] ?? [];
    return customers;
  }

  setBusinessTour(BusinessTour value) {
    selectedBusinessTour.value = value;
  }

  setTrip(Trip value) {
    selectedTrip.value = value;
  }
}
