import 'package:booking_yatch_agency/core/models/business_tours_response.dart';
import 'package:booking_yatch_agency/core/models/customer_model.dart';
import 'package:booking_yatch_agency/core/models/data_response_model.dart';
import 'package:booking_yatch_agency/core/models/order_request_model.dart';
import 'package:booking_yatch_agency/core/models/ticket_request_model.dart';
import 'package:booking_yatch_agency/core/repositories/order/order_repo_impl.dart';
import 'package:booking_yatch_agency/features/authen/controller/authen_controller.dart';
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

  initTrip() {
    final trips = selectedBusinessTour.value.trips;
    selectedTrip.value = trips[0];
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

  final authenController = Get.find<AuthenController>();
  final orderRepo = Get.find<OrderRepoImpl>();
  RxString orderId = ''.obs;
  RxInt paymentMethod = 0.obs;

  setPaymentMethod(value) {
    paymentMethod = value;
  }

  createOrder() async {
    // Push order
    // ignore: invalid_use_of_protected_member
    var user = authenController.user.value;
    OrderRequest model = OrderRequest(
      idAgency: user['Id'] ?? '',
      idTrip: selectedTrip.value.id,
      orderDate: DateTime.now(),
      totalPrice: getTotalPrice(),
      quantityOfPerson: getQuantity(),
    );
    var orderResponse = await orderRepo.createOrder(model);
    if (orderResponse.data.isEmpty) return;
    orderId.value = orderResponse.data;

    // Push TicketTypes
    List<TicketType> ticketTypes = selectedBusinessTour.value.ticketTypes;

    List<String> customerNames = [];
    List<String> phones = [];
    List<String> idTicketTypes = [];

    for (int i = 0; i < ticketTypes.length; i++) {
      String id = ticketTypes[i].id;
      List<Customer> list = ticketTypesMap[id] ?? [];

      for (int i = 0; i < list.length; i++) {
        customerNames.add(list[i].name);
        phones.add(list[i].phone);
        idTicketTypes.add(id);
      }
    }
    TicketRequest ticketRequest = TicketRequest(
      idOrder: orderId.value,
      idTrip: selectedTrip.value.id,
      customerNames: customerNames,
      phones: phones,
      idTicketTypes: idTicketTypes,
    );
    orderRepo.createTicket(ticketRequest);
  }

// #endregion
}
