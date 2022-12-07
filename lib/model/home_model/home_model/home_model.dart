import 'data.dart';

class HomeModel {
	String? message;
	Data? data;

	HomeModel({this.message, this.data});

	factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
				message: json['message'] as String?,
				data: json['data'] == null
						? null : Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.toJson(),
			};
}
