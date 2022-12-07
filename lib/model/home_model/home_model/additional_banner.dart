class AdditionalBanner {
	int? id;
	String? bannerOrder;
	String? bannerImg;

	AdditionalBanner({this.id, this.bannerOrder, this.bannerImg});

	factory AdditionalBanner.fromJson(Map<String, dynamic> json) {
		return AdditionalBanner(
			id: json['id'] as int?,
			bannerOrder: json['banner_order'] as String?,
			bannerImg: json['banner_img'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'banner_order': bannerOrder,
				'banner_img': bannerImg,
			};
}
