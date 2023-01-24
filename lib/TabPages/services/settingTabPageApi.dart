// To parse this JSON data, do
//
//     final documentRequest = documentRequestFromJson(jsonString);

import 'dart:convert';

class DocumentRequest {
  DocumentRequest({
    this.content,
    this.pageable,
    this.totalPages,
    this.totalElements,
    this.last,
    this.size,
    this.number,
    this.sort,
    this.numberOfElements,
    this.first,
    this.empty,
  });

  List<Content> ?content;
  Pageable? pageable;
  int ?totalPages;
  int? totalElements;
  bool? last;
  int ?size;
  int ?number;
  Sort ?sort;
  int ?numberOfElements;
  bool? first;
  bool? empty;

  factory DocumentRequest.fromJson(Map<String, dynamic> json) => DocumentRequest(
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    pageable: Pageable.fromJson(json["pageable"]),
    totalPages: json["totalPages"],
    totalElements: json["totalElements"],
    last: json["last"],
    size: json["size"],
    number: json["number"],
    sort: Sort.fromJson(json["sort"]),
    numberOfElements: json["numberOfElements"],
    first: json["first"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content!.map((x) => x.toJson())),
    "pageable": pageable!.toJson(),
    "totalPages": totalPages,
    "totalElements": totalElements,
    "last": last,
    "size": size,
    "number": number,
    "sort": sort!.toJson(),
    "numberOfElements": numberOfElements,
    "first": first,
    "empty": empty,
  };
}

class Content {
  Content({
    this.id,
    this.requestNo,
    this.pickedBy,
    this.createdBy,
    this.isVerified,
    this.isPicked,
    this.cancelled,
    this.remarks,
    this.isReturned,
    this.createInfo,
  });

  int? id;
  String ?requestNo;
  dynamic? pickedBy;
  CreatedBy? createdBy;
  bool ?isVerified;
  bool ?isPicked;
  bool ?cancelled;
  String ?remarks;
  bool? isReturned;
  CreateInfo? createInfo;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    requestNo: json["request_no"],
    pickedBy: json["pickedBy"],
    createdBy: CreatedBy.fromJson(json["createdBy"]),
    isVerified: json["isVerified"],
    isPicked: json["isPicked"],
    cancelled: json["cancelled"],
    remarks: json["remarks"],
    isReturned: json["isReturned"],
    createInfo: CreateInfo.fromJson(json["createInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "request_no": requestNo,
    "pickedBy": pickedBy,
    "createdBy": createdBy!.toJson(),
    "isVerified": isVerified,
    "isPicked": isPicked,
    "cancelled": cancelled,
    "remarks": remarks,
    "isReturned": isReturned,
    "createInfo": createInfo!.toJson(),
  };
}

class CreateInfo {
  CreateInfo({
    this.createdAtAd,
    this.updatedAtAd,
    this.createdAtBs,
  });

  DateTime? createdAtAd;
  dynamic ?updatedAtAd;
  String ?createdAtBs;

  factory CreateInfo.fromJson(Map<String, dynamic> json) => CreateInfo(
    createdAtAd: DateTime.parse(json["createdAtAd"]),
    updatedAtAd: json["updatedAtAd"],
    createdAtBs: json["createdAtBs"],
  );

  Map<String, dynamic> toJson() => {
    "createdAtAd": createdAtAd!.toIso8601String(),
    "updatedAtAd": updatedAtAd,
    "createdAtBs": createdAtBs,
  };
}

class CreatedBy {
  CreatedBy({
    this.id,
    this.username,
    this.email,
  });

  int ?id;
  String ?username;
  String ?email;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
  };
}

class Pageable {
  Pageable({
    this.offset,
    this.sort,
    this.pageNumber,
    this.pageSize,
    this.paged,
    this.unpaged,
  });

  int? offset;
  Sort? sort;
  int? pageNumber;
  int ?pageSize;
  bool? paged;
  bool? unpaged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
    offset: json["offset"],
    sort: Sort.fromJson(json["sort"]),
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    paged: json["paged"],
    unpaged: json["unpaged"],
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "sort": sort!.toJson(),
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "paged": paged,
    "unpaged": unpaged,
  };
}

class Sort {
  Sort({
    this.empty,
    this.sorted,
    this.unsorted,
  });

  bool ?empty;
  bool ?sorted;
  bool ?unsorted;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    empty: json["empty"],
    sorted: json["sorted"],
    unsorted: json["unsorted"],
  );

  Map<String, dynamic> toJson() => {
    "empty": empty,
    "sorted": sorted,
    "unsorted": unsorted,
  };
}
