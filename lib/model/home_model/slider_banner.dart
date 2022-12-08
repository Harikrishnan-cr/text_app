class SliderBanner {
	int? id;
	String? bannerOrder;
	String? bannerImg;

	SliderBanner({this.id, this.bannerOrder, this.bannerImg});

	factory SliderBanner.fromJson(Map<String, dynamic> json) => SliderBanner(
				id: json['id'] as int?,
				bannerOrder: json['banner_order'] as String?,
				bannerImg: json['banner_img'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'banner_order': bannerOrder,
				'banner_img': bannerImg,
			};
}
