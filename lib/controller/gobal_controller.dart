import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/core/models/customer_model.dart';
import 'package:booking_yatch_agency/core/models/order_request_model.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
// #region BusinessTour
  Rx<BusinessTour> selectedBusinessTour = BusinessTour().obs;

  setBusinessTour(BusinessTour value) {
    selectedBusinessTour.value = value;
  }
// #endregion

// #region SelectedTrip
  Rx<Trip> selectedTrip = Trip().obs;

  setTrip(Trip value) {
    selectedTrip.value = value;
  }
// #endregion

// #region TicketType

  RxMap<String, List<Customer>> ticketTypesMap =
      RxMap<String, List<Customer>>();

  initTicketTypesMap() {
    ticketTypesMap.clear();
  }

  double getTotalPrice() {
    List<TicketType> ticketTypes = selectedBusinessTour.value.ticketTypes;
    double result = 0;

    for (int i = 0; i < ticketTypes.length; i++) {
      String id = ticketTypes[i].id;
      List<Customer> list = ticketTypesMap[id] ?? [];
      result = result + (list.length * ticketTypes[i].price);
    }
    return result;
  }

  int getQuantity() {
    List<TicketType> ticketTypes = selectedBusinessTour.value.ticketTypes;
    int result = 0;

    for (int i = 0; i < ticketTypes.length; i++) {
      String id = ticketTypes[i].id;
      List<Customer> list = ticketTypesMap[id] ?? [];
      result += list.length;
    }
    return result;
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

  updateCustomer(
    String id,
    int index, {
    String? name,
    String? phone,
  }) {
    List<Customer> customers = ticketTypesMap[id] ?? [];
    if (name != null) {
      customers[index].name = name;
    }
    if (phone != null) {
      customers[index].phone = phone;
    }
    ticketTypesMap[id] = customers;
  }
// #endregion

// #region Order

  createOrder() {
    OrderRequest model = OrderRequest();
  }

// #endregion
}
