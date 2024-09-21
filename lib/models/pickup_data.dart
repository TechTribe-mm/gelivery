class PickupItem {
  final String trackingId;
  final String osName;
  final String pickupDate;
  final String osPrimaryPhone;
  final String osTownshipName;
  final int totalWays;

  PickupItem({
    required this.trackingId,
    required this.osName,
    required this.pickupDate,
    required this.osPrimaryPhone,
    required this.osTownshipName,
    required this.totalWays,
  });

  factory PickupItem.fromJson(Map<String, dynamic> json) {
    return PickupItem(
      trackingId: json['trackingId'],
      osName: json['osName'],
      pickupDate: json['pickupDate'],
      osPrimaryPhone: json['osPrimaryPhone'],
      osTownshipName: json['osTownshipName'],
      totalWays: json['totalWays'],
    );
  }
}

class PickupListResponse {
  final bool success;
  final List<PickupItem> items;
  final int totalRecords;

  PickupListResponse({
    required this.success,
    required this.items,
    required this.totalRecords,
  });

  factory PickupListResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data']['items'] as List;
    List<PickupItem> itemsList =
        list.map((i) => PickupItem.fromJson(i)).toList();
    return PickupListResponse(
      success: json['success'],
      items: itemsList,
      totalRecords: json['data']['totalRecords'],
    );
  }
}
