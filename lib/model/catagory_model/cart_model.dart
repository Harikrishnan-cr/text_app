
class CartModel {
	String? message;
	List<Datum>? data;

	CartModel({this.message, this.data});

	factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
				message: json['message'] as String?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
class Datum {
	int? catId;
	String? catName;
	String? catImg;
	dynamic childData;

	Datum({this.catId, this.catName, this.catImg, this.childData});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				catId: json['cat_id'] as int?,
				catName: json['cat_name'] as String?,
				catImg: json['cat_img'] as String?,
				childData: json['child_data'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'cat_id': catId,
				'cat_name': catName,
				'cat_img': catImg,
				'child_data': childData,
			};
}