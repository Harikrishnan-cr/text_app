import 'additional_banner.dart';
import 'bestseller_product.dart';
import 'featured_product.dart';
import 'slider_banner.dart';

class Data {
	List<SliderBanner>? sliderBanners;
	List<AdditionalBanner>? additionalBanners;
	List<FeaturedProduct>? featuredProducts;
	List<BestsellerProduct>? bestsellerProducts;

	Data({
		this.sliderBanners, 
		this.additionalBanners, 
		this.featuredProducts, 
		this.bestsellerProducts, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				sliderBanners: (json['slider_banners'] as List<dynamic>?)
						?.map((e) => SliderBanner.fromJson(e as Map<String, dynamic>))
						.toList(),
				additionalBanners: (json['additional_banners'] as List<dynamic>?)
						?.map((e) => AdditionalBanner.fromJson(e as Map<String, dynamic>))
						.toList(),
				featuredProducts: (json['featured_products'] as List<dynamic>?)
						?.map((e) => FeaturedProduct.fromJson(e as Map<String, dynamic>))
						.toList(),
				bestsellerProducts: (json['bestseller_products'] as List<dynamic>?)
						?.map((e) => BestsellerProduct.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'slider_banners': sliderBanners?.map((e) => e.toJson()).toList(),
				'additional_banners': additionalBanners?.map((e) => e.toJson()).toList(),
				'featured_products': featuredProducts?.map((e) => e.toJson()).toList(),
				'bestseller_products': bestsellerProducts?.map((e) => e.toJson()).toList(),
			};
}
