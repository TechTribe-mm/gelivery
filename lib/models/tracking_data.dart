// class PickupList {
//   bool success;
//   Data data;
//   String message;

//   PickupList({
//     required this.success,
//     required this.data,
//     required this.message,
//   });

//   factory PickupList.fromJson(Map<String, dynamic> json) {
//     return PickupList(
//       success: json['success'],
//       data: Data.fromJson(json['data']),
//       message: json['message'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       'data': data.toJson(),
//       'message': message,
//     };
//   }
// }

// class Data {
//   List<Item> items;
//   int totalRecords;
//   double totalDue;
//   double totalAmount;
//   dynamic codSummaryItem; // Use dynamic as it can be null or any type
//   double totalWays;

//   Data({
//     required this.items,
//     required this.totalRecords,
//     required this.totalDue,
//     required this.totalAmount,
//     this.codSummaryItem,
//     required this.totalWays,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) {
//     var itemsFromJson = json['items'] as List;
//     List<Item> itemsList = itemsFromJson.map((i) => Item.fromJson(i)).toList();

//     return Data(
//       items: itemsList,
//       totalRecords: json['totalRecords'],
//       totalDue: json['totalDue'],
//       totalAmount: json['totalAmount'],
//       codSummaryItem: json['codSummaryItem'],
//       totalWays: json['totalWays'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'items': items.map((item) => item.toJson()).toList(),
//       'totalRecords': totalRecords,
//       'totalDue': totalDue,
//       'totalAmount': totalAmount,
//       'codSummaryItem': codSummaryItem,
//       'totalWays': totalWays,
//     };
//   }
// }

// class Item {
//   String contentGUID;
//   String trackingId;
//   String status;
//   String createdOn;
//   String updatedOn;
//   double totalCharges;
//   double? forShowCharges;
//   double? cod;
//   int? totalItems;
//   String osName;
//   String osAddress;
//   String pickupDate;
//   String osGUID;
//   String? osContactGUID;
//   String? customerName;
//   String? customerAddress;
//   String? dropOffDate;
//   String? customerGUID;
//   String? customerContactGUID;
//   String pickupPersonName;
//   String pickupPersonGUID;
//   String? pickupPersonAssignGUID;
//   double pickupPersonLatitude;
//   double pickupPersonLongitude;
//   String? dropOffPersonName;
//   String? dropOffPersonGUID;
//   String? dropOffPersonAssignGUID;
//   double? dropOffPersonLatitude;
//   double? dropOffPersonLongitude;
//   double? labourCost;
//   double? transportCost;
//   double? extraCost;
//   double totalDeliveryCharges;
//   double totalItemPrice;
//   double? promotionAmount;
//   double dueAmount;
//   String osPrimaryPhone;
//   String? osOtherPhones;
//   String osComment;
//   double osLatitude;
//   double osLongitude;
//   String osPersonId;
//   String osTownshipName;
//   String? osTownshipNameEn;
//   String osAddressType;
//   String? customerPrimaryPhone;
//   String? customerOtherPhones;
//   String? customerComment;
//   double? customerLatitude;
//   double? customerLongitude;
//   String? customerPersonId;
//   String? customerTownshipName;
//   String? customerStreetName;
//   String? customerTownshipNameEn;
//   String? customerStateName;
//   String? customerAddressType;
//   String pickupPersonPrimaryPhone;
//   String? pickupPersonOtherPhones;
//   String? pickupPersonAvatar;
//   String? dropOffPersonPrimaryPhone;
//   String? dropOffPersonOtherPhones;
//   String? dropOffPersonAvatar;
//   bool refundInAdvanced;
//   double refundAmount;
//   String refundDate;
//   String name;
//   String? townshipGuid;
//   int totalWays;
//   List<dynamic>? images; // Change this based on your actual image structure
//   int itemCount;
//   int addressCount;
//   int completedCount;
//   double? pickupCharges;
//   bool refunded;
//   dynamic deliveryItem; // Use dynamic as it can be null or any type
//   double? totalCashToCollect;
//   bool? checked;
//   String? highestMessage;
//   String? roleName;
//   String? refundOption;
//   bool carRequired;
//   String? inboundStationGuid;
//   String? inboundStationName;
//   String? outboundStationGuid;
//   String? outboundStationName;
//   String? inboundBucketGuid;
//   String? inboundBucketName;
//   String? inboundBucketStatus;
//   String? outboundBucketGuid;
//   String? outboundBucketName;
//   String? outboundBucketStatus;
//   String? scheduleGuid;
//   String? scheduleTime;
//   bool? codTransferred;
//   bool? codCollected;
//   String? deliveryMethods;
//   String? customerSignature;
//   String? dropOffPersonSignature;
//   String? pickupTrackingId;
//   int updatedCount;
//   double? finalCashCollected;
//   double? nonCashCollected;
//   String? receivedOption;
//   String? receivedOptionName;
//   String? nonCashTransferTo;
//   String? reasonOfReduceAmount;
//   double cashAdvanceAmount;
//   bool cashAdvanceRelease;
//   String? cashAdvanceReleaseDate;
//   double prepaidAmount;
//   double? weight;
//   double? width;
//   String remark;
//   bool? collected;
//   String? collectedDate;
//   double? codCollectedAmount;
//   double? codTransferAmount;
//   double? payableAmount;
//   double? receivableAmount;
//   String? completedDate;
//   String? transferDate;
//   String? payableDate;
//   String? receivableDate;
//   String? importRaw;
//   String? extraPaidBy;
//   String? wayName;
//   String? message;
//   String? updatedBy;
//   bool marketHub;
//   String routeInboundBucketStatus;
//   String routeStatus;
//   String? failedReason;
//   String zoneName;
//   String zoneGUID;
//   String branchName;
//   String branchGUID;
//   int? unInvoiceCount;
//   String? serialNo;

//   Item({
//     required this.contentGUID,
//     required this.trackingId,
//     required this.status,
//     required this.createdOn,
//     required this.updatedOn,
//     required this.totalCharges,
//     this.forShowCharges,
//     this.cod,
//     this.totalItems,
//     required this.osName,
//     required this.osAddress,
//     required this.pickupDate,
//     required this.osGUID,
//     this.osContactGUID,
//     this.customerName,
//     this.customerAddress,
//     this.dropOffDate,
//     this.customerGUID,
//     this.customerContactGUID,
//     required this.pickupPersonName,
//     required this.pickupPersonGUID,
//     this.pickupPersonAssignGUID,
//     required this.pickupPersonLatitude,
//     required this.pickupPersonLongitude,
//     this.dropOffPersonName,
//     this.dropOffPersonGUID,
//     this.dropOffPersonAssignGUID,
//     this.dropOffPersonLatitude,
//     this.dropOffPersonLongitude,
//     this.labourCost,
//     this.transportCost,
//     this.extraCost,
//     required this.totalDeliveryCharges,
//     required this.totalItemPrice,
//     this.promotionAmount,
//     required this.dueAmount,
//     required this.osPrimaryPhone,
//     this.osOtherPhones,
//     required this.osComment,
//     required this.osLatitude,
//     required this.osLongitude,
//     required this.osPersonId,
//     required this.osTownshipName,
//     this.osTownshipNameEn,
//     required this.osAddressType,
//     this.customerPrimaryPhone,
//     this.customerOtherPhones,
//     this.customerComment,
//     this.customerLatitude,
//     this.customerLongitude,
//     this.customerPersonId,
//     this.customerTownshipName,
//     this.customerStreetName,
//     this.customerTownshipNameEn,
//     this.customerStateName,
//     this.customerAddressType,
//     required this.pickupPersonPrimaryPhone,
//     this.pickupPersonOtherPhones,
//     this.pickupPersonAvatar,
//     this.dropOffPersonPrimaryPhone,
//     this.dropOffPersonOtherPhones,
//     this.dropOffPersonAvatar,
//     required this.refundInAdvanced,
//     required this.refundAmount,
//     required this.refundDate,
//     required this.name,
//     this.townshipGuid,
//     required this.totalWays,
//     this.images,
//     required this.itemCount,
//     required this.addressCount,
//     required this.completedCount,
//     this.pickupCharges,
//     required this.refunded,
//     this.deliveryItem,
//     this.totalCashToCollect,
//     this.checked,
//     this.highestMessage,
//     this.roleName,
//     this.refundOption,
//     required this.carRequired,
//     this.inboundStationGuid,
//     this.inboundStationName,
//     this.outboundStationGuid,
//     this.outboundStationName,
//     this.inboundBucketGuid,
//     this.inboundBucketName,
//     this.inboundBucketStatus,
//     this.outboundBucketGuid,
//     this.outboundBucketName,
//     this.outboundBucketStatus,
//     this.scheduleGuid,
//     this.scheduleTime,
//     this.codTransferred,
//     this.codCollected,
//     this.deliveryMethods,
//     this.customerSignature,
//     this.dropOffPersonSignature,
//     this.pickupTrackingId,
//     required this.updatedCount,
//     this.finalCashCollected,
//     this.nonCashCollected,
//     this.receivedOption,
//     this.receivedOptionName,
//     this.nonCashTransferTo,
//     this.reasonOfReduceAmount,
//     required this.cashAdvanceAmount,
//     required this.cashAdvanceRelease,
//     this.cashAdvanceReleaseDate,
//     required this.prepaidAmount,
//     this.weight,
//     this.width,
//     required this.remark,
//     this.collected,
//     this.collectedDate,
//     this.codCollectedAmount,
//     this.codTransferAmount,
//     this.payableAmount,
//     this.receivableAmount,
//     this.completedDate,
//     this.transferDate,
//     this.payableDate,
//     this.receivableDate,
//     this.importRaw,
//     this.extraPaidBy,
//     this.wayName,
//     this.message,
//     this.updatedBy,
//     required this.marketHub,
//     required this.routeInboundBucketStatus,
//     required this.routeStatus,
//     this.failedReason,
//     required this.zoneName,
//     required this.zoneGUID,
//     required this.branchName,
//     required this.branchGUID,
//     this.unInvoiceCount,
//     this.serialNo,
//   });

//   factory Item.fromJson(Map<String, dynamic> json) {
//     return Item(
//       contentGUID: json['contentGUID'],
//       trackingId: json['trackingId'],
//       status: json['status'],
//       createdOn: json['createdOn'],
//       updatedOn: json['updatedOn'],
//       totalCharges: json['totalCharges'],
//       forShowCharges: json['forShowCharges'],
//       cod: json['cod'],
//       totalItems: json['totalItems'],
//       osName: json['osName'],
//       osAddress: json['osAddress'],
//       pickupDate: json['pickupDate'],
//       osGUID: json['osGUID'],
//       osContactGUID: json['osContactGUID'],
//       customerName: json['customerName'],
//       customerAddress: json['customerAddress'],
//       dropOffDate: json['dropOffDate'],
//       customerGUID: json['customerGUID'],
//       customerContactGUID: json['customerContactGUID'],
//       pickupPersonName: json['pickupPersonName'],
//       pickupPersonGUID: json['pickupPersonGUID'],
//       pickupPersonAssignGUID: json['pickupPersonAssignGUID'],
//       pickupPersonLatitude: json['pickupPersonLatitude'],
//       pickupPersonLongitude: json['pickupPersonLongitude'],
//       dropOffPersonName: json['dropOffPersonName'],
//       dropOffPersonGUID: json['dropOffPersonGUID'],
//       dropOffPersonAssignGUID: json['dropOffPersonAssignGUID'],
//       dropOffPersonLatitude: json['dropOffPersonLatitude'],
//       dropOffPersonLongitude: json['dropOffPersonLongitude'],
//       labourCost: json['labourCost'],
//       transportCost: json['transportCost'],
//       extraCost: json['extraCost'],
//       totalDeliveryCharges: json['totalDeliveryCharges'],
//       totalItemPrice: json['totalItemPrice'],
//       promotionAmount: json['promotionAmount'],
//       dueAmount: json['dueAmount'],
//       osPrimaryPhone: json['osPrimaryPhone'],
//       osOtherPhones: json['osOtherPhones'],
//       osComment: json['osComment'],
//       osLatitude: json['osLatitude'],
//       osLongitude: json['osLongitude'],
//       osPersonId: json['osPersonId'],
//       osTownshipName: json['osTownshipName'],
//       osTownshipNameEn: json['osTownshipNameEn'],
//       osAddressType: json['osAddressType'],
//       customerPrimaryPhone: json['customerPrimaryPhone'],
//       customerOtherPhones: json['customerOtherPhones'],
//       customerComment: json['customerComment'],
//       customerLatitude: json['customerLatitude'],
//       customerLongitude: json['customerLongitude'],
//       customerPersonId: json['customerPersonId'],
//       customerTownshipName: json['customerTownshipName'],
//       customerStreetName: json['customerStreetName'],
//       customerTownshipNameEn: json['customerTownshipNameEn'],
//       customerStateName: json['customerStateName'],
//       customerAddressType: json['customerAddressType'],
//       pickupPersonPrimaryPhone: json['pickupPersonPrimaryPhone'],
//       pickupPersonOtherPhones: json['pickupPersonOtherPhones'],
//       pickupPersonAvatar: json['pickupPersonAvatar'],
//       dropOffPersonPrimaryPhone: json['dropOffPersonPrimaryPhone'],
//       dropOffPersonOtherPhones: json['dropOffPersonOtherPhones'],
//       dropOffPersonAvatar: json['dropOffPersonAvatar'],
//       refundInAdvanced: json['refundInAdvanced'],
//       refundAmount: json['refundAmount'],
//       refundDate: json['refundDate'],
//       name: json['name'],
//       townshipGuid: json['townshipGuid'],
//       totalWays: json['totalWays'],
//       images: json['images'],
//       itemCount: json['itemCount'],
//       addressCount: json['addressCount'],
//       completedCount: json['completedCount'],
//       pickupCharges: json['pickupCharges'],
//       refunded: json['refunded'],
//       deliveryItem: json['deliveryItem'],
//       totalCashToCollect: json['totalCashToCollect'],
//       checked: json['checked'],
//       highestMessage: json['highestMessage'],
//       roleName: json['roleName'],
//       refundOption: json['refundOption'],
//       carRequired: json['carRequired'],
//       inboundStationGuid: json['inboundStationGuid'],
//       inboundStationName: json['inboundStationName'],
//       outboundStationGuid: json['outboundStationGuid'],
//       outboundStationName: json['outboundStationName'],
//       inboundBucketGuid: json['inboundBucketGuid'],
//       inboundBucketName: json['inboundBucketName'],
//       inboundBucketStatus: json['inboundBucketStatus'],
//       outboundBucketGuid: json['outboundBucketGuid'],
//       outboundBucketName: json['outboundBucketName'],
//       outboundBucketStatus: json['outboundBucketStatus'],
//       scheduleGuid: json['scheduleGuid'],
//       scheduleTime: json['scheduleTime'],
//       codTransferred: json['codTransferred'],
//       codCollected: json['codCollected'],
//       deliveryMethods: json['deliveryMethods'],
//       customerSignature: json['customerSignature'],
//       dropOffPersonSignature: json['dropOffPersonSignature'],
//       pickupTrackingId: json['pickupTrackingId'],
//       updatedCount: json['updatedCount'],
//       finalCashCollected: json['finalCashCollected'],
//       nonCashCollected: json['nonCashCollected'],
//       receivedOption: json['receivedOption'],
//       receivedOptionName: json['receivedOptionName'],
//       nonCashTransferTo: json['nonCashTransferTo'],
//       reasonOfReduceAmount: json['reasonOfReduceAmount'],
//       cashAdvanceAmount: json['cashAdvanceAmount'],
//       cashAdvanceRelease: json['cashAdvanceRelease'],
//       cashAdvanceReleaseDate: json['cashAdvanceReleaseDate'],
//       prepaidAmount: json['prepaidAmount'],
//       weight: json['weight'],
//       width: json['width'],
//       remark: json['remark'],
//       collected: json['collected'],
//       collectedDate: json['collectedDate'],
//       codCollectedAmount: json['codCollectedAmount'],
//       codTransferAmount: json['codTransferAmount'],
//       payableAmount: json['payableAmount'],
//       receivableAmount: json['receivableAmount'],
//       completedDate: json['completedDate'],
//       transferDate: json['transferDate'],
//       payableDate: json['payableDate'],
//       receivableDate: json['receivableDate'],
//       importRaw: json['importRaw'],
//       extraPaidBy: json['extraPaidBy'],
//       wayName: json['wayName'],
//       message: json['message'],
//       updatedBy: json['updatedBy'],
//       marketHub: json['marketHub'],
//       routeInboundBucketStatus: json['routeInboundBucketStatus'],
//       routeStatus: json['routeStatus'],
//       failedReason: json['failedReason'],
//       zoneName: json['zoneName'],
//       zoneGUID: json['zoneGUID'],
//       branchName: json['branchName'],
//       branchGUID: json['branchGUID'],
//       unInvoiceCount: json['unInvoiceCount'],
//       serialNo: json['serialNo'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'contentGUID': contentGUID,
//       'trackingId': trackingId,
//       'status': status,
//       'createdOn': createdOn,
//       'updatedOn': updatedOn,
//       'totalCharges': totalCharges,
//       'forShowCharges': forShowCharges,
//       'cod': cod,
//       'totalItems': totalItems,
//       'osName': osName,
//       'osAddress': osAddress,
//       'pickupDate': pickupDate,
//       'osGUID': osGUID,
//       'osContactGUID': osContactGUID,
//       'customerName': customerName,
//       'customerAddress': customerAddress,
//       'dropOffDate': dropOffDate,
//       'customerGUID': customerGUID,
//       'customerContactGUID': customerContactGUID,
//       'pickupPersonName': pickupPersonName,
//       'pickupPersonGUID': pickupPersonGUID,
//       'pickupPersonAssignGUID': pickupPersonAssignGUID,
//       'pickupPersonLatitude': pickupPersonLatitude,
//       'pickupPersonLongitude': pickupPersonLongitude,
//       'dropOffPersonName': dropOffPersonName,
//       'dropOffPersonGUID': dropOffPersonGUID,
//       'dropOffPersonAssignGUID': dropOffPersonAssignGUID,
//       'dropOffPersonLatitude': dropOffPersonLatitude,
//       'dropOffPersonLongitude': dropOffPersonLongitude,
//       'labourCost': labourCost,
//       'transportCost': transportCost,
//       'extraCost': extraCost,
//       'totalDeliveryCharges': totalDeliveryCharges,
//       'totalItemPrice': totalItemPrice,
//       'promotionAmount': promotionAmount,
//       'dueAmount': dueAmount,
//       'osPrimaryPhone': osPrimaryPhone,
//       'osOtherPhones': osOtherPhones,
//       'osComment': osComment,
//       'osLatitude': osLatitude,
//       'osLongitude': osLongitude,
//       'osPersonId': osPersonId,
//       'osTownshipName': osTownshipName,
//       'osTownshipNameEn': osTownshipNameEn,
//       'osAddressType': osAddressType,
//       'customerPrimaryPhone': customerPrimaryPhone,
//       'customerOtherPhones': customerOtherPhones,
//       'customerComment': customerComment,
//       'customerLatitude': customerLatitude,
//       'customerLongitude': customerLongitude,
//       'customerPersonId': customerPersonId,
//       'customerTownshipName': customerTownshipName,
//       'customerStreetName': customerStreetName,
//       'customerTownshipNameEn': customerTownshipNameEn,
//       'customerStateName': customerStateName,
//       'customerAddressType': customerAddressType,
//       'pickupPersonPrimaryPhone': pickupPersonPrimaryPhone,
//       'pickupPersonOtherPhones': pickupPersonOtherPhones,
//       'pickupPersonAvatar': pickupPersonAvatar,
//       'dropOffPersonPrimaryPhone': dropOffPersonPrimaryPhone,
//       'dropOffPersonOtherPhones': dropOffPersonOtherPhones,
//       'dropOffPersonAvatar': dropOffPersonAvatar,
//       'refundInAdvanced': refundInAdvanced,
//       'refundAmount': refundAmount,
//       'refundDate': refundDate,
//       'name': name,
//       'townshipGuid': townshipGuid,
//       'totalWays': totalWays,
//       'images': images,
//       'itemCount': itemCount,
//       'addressCount': addressCount,
//       'completedCount': completedCount,
//       'pickupCharges': pickupCharges,
//       'refunded': refunded,
//       'deliveryItem': deliveryItem,
//       'totalCashToCollect': totalCashToCollect,
//       'checked': checked,
//       'highestMessage': highestMessage,
//       'roleName': roleName,
//       'refundOption': refundOption,
//       'carRequired': carRequired,
//       'inboundStationGuid': inboundStationGuid,
//       'inboundStationName': inboundStationName,
//       'outboundStationGuid': outboundStationGuid,
//       'outboundStationName': outboundStationName,
//       'inboundBucketGuid': inboundBucketGuid,
//       'inboundBucketName': inboundBucketName,
//       'inboundBucketStatus': inboundBucketStatus,
//       'outboundBucketGuid': outboundBucketGuid,
//       'outboundBucketName': outboundBucketName,
//       'outboundBucketStatus': outboundBucketStatus,
//       'scheduleGuid': scheduleGuid,
//       'scheduleTime': scheduleTime,
//       'codTransferred': codTransferred,
//       'codCollected': codCollected,
//       'deliveryMethods': deliveryMethods,
//       'customerSignature': customerSignature,
//       'dropOffPersonSignature': dropOffPersonSignature,
//       'pickupTrackingId': pickupTrackingId,
//       'updatedCount': updatedCount,
//       'finalCashCollected': finalCashCollected,
//       'nonCashCollected': nonCashCollected,
//       'receivedOption': receivedOption,
//       'receivedOptionName': receivedOptionName,
//       'nonCashTransferTo': nonCashTransferTo,
//       'reasonOfReduceAmount': reasonOfReduceAmount,
//       'cashAdvanceAmount': cashAdvanceAmount,
//       'cashAdvanceRelease': cashAdvanceRelease,
//       'cashAdvanceReleaseDate': cashAdvanceReleaseDate,
//       'prepaidAmount': prepaidAmount,
//       'weight': weight,
//       'width': width,
//       'remark': remark,
//       'collected': collected,
//       'collectedDate': collectedDate,
//       'codCollectedAmount': codCollectedAmount,
//       'codTransferAmount': codTransferAmount,
//       'payableAmount': payableAmount,
//       'receivableAmount': receivableAmount,
//       'completedDate': completedDate,
//       'transferDate': transferDate,
//       'payableDate': payableDate,
//       'receivableDate': receivableDate,
//       'importRaw': importRaw,
//       'extraPaidBy': extraPaidBy,
//       'wayName': wayName,
//       'message': message,
//       'updatedBy': updatedBy,
//       'marketHub': marketHub,
//       'routeInboundBucketStatus': routeInboundBucketStatus,
//       'routeStatus': routeStatus,
//       'failedReason': failedReason,
//       'zoneName': zoneName,
//       'zoneGUID': zoneGUID,
//       'branchName': branchName,
//       'branchGUID': branchGUID,
//       'unInvoiceCount': unInvoiceCount,
//       'serialNo': serialNo,
//     };
//   }
// }
