


// import 'dart:convert';
// CatagoryModel catagoryModelFromJson(String str) => CatagoryModel.from(json.decode(str).map((x) => CatagoryModel.fromJson(x)));

// String catagoryModelToJson(List<CatagoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class CatagoryModel {
//     CatagoryModel({
//        required this.message,
//        required this.data,
//     });

//     String message;
//     List<Datum> data;

//     factory CatagoryModel.fromJson(Map<String, dynamic> json) => CatagoryModel(
//         message: json["message"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     Datum({
//        required this.catId,
//        required this.catName,
//        required this.catImg,
//        required this.childData,
//     });

//     int catId;
//     String catName;
//     String catImg;
//     List<ChildDatum> childData;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         catId: json["cat_id"],
//         catName: json["cat_name"],
//         catImg: json["cat_img"],
//         childData: List<ChildDatum>.from(json["child_data"].map((x) => ChildDatum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "cat_id": catId,
//         "cat_name": catName,
//         "cat_img": catImg,
//         "child_data": childData == null ? null : List<dynamic>.from(childData.map((x) => x.toJson())),
//     };
// }

// class ChildDatum {
//     ChildDatum({
//       required  this.catId,
//       required  this.catName,
//       required  this.catStatus,
//       required  this.catImage,
//     });

//     int catId;
//     String catName;
//     String catStatus;
//     String catImage;

//     factory ChildDatum.fromJson(Map<String, dynamic> json) => ChildDatum(
//         catId: json["cat_id"],
//         catName: json["cat_name"],
//         catStatus: json["cat_status"],
//         catImage: json["cat_image"],
//     );

//     Map<String, dynamic> toJson() => {
//         "cat_id": catId,
//         "cat_name": catName,
//         "cat_status": catStatus,
//         "cat_image": catImage,
//     };
// }
