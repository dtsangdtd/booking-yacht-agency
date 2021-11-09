import 'package:booking_yatch_agency/controller/gobal_controller.dart';
import 'package:booking_yatch_agency/core/models/ticket_response_model.dart';
import 'package:booking_yatch_agency/core/repositories/ticket/ticket_repo.dart';
import 'package:booking_yatch_agency/core/repositories/ticket/ticket_repo_impl.dart';
import 'package:get/get.dart';

class SuccessController extends GetxController {
  late TicketRepo _ticketRepo;
  late GlobalController _globalController;

  SuccessController() {
    _ticketRepo = Get.find<TicketRepoImpl>();
    _globalController = Get.find<GlobalController>();
    loadTicketMap();
  }

  RxMap<String, List<Ticket>> ticketMap = RxMap<String, List<Ticket>>();
  RxBool isLoading = false.obs;

  loadTicketMap() async {
    isLoading.value = true;

    var businessTour = _globalController.selectedBusinessTour.value;
    var orderId = _globalController.orderId.value;
    var ticketTypes = businessTour.ticketTypes;

    for (var item in ticketTypes) {
      List<Ticket> tickets = await _ticketRepo.getTickets(orderId, item.id);
      // ignore: invalid_use_of_protected_member
      ticketMap[item.id] = tickets;
    }

    isLoading.value = false;
  }
}
