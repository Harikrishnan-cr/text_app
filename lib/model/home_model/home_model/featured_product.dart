class FeaturedProduct {
	int? id;
	String? name;
	String? sku;
	String? categoryId;
	String? categoryName;
	String? isVeg;
	String? description;
	String? price;
	dynamic specialPrice;
	String? availableFrom;
	String? availableTo;
	String? image;
	List<dynamic>? variations;

	FeaturedProduct({
		this.id, 
		this.name, 
		this.sku, 
		this.categoryId, 
		this.categoryName, 
		this.isVeg, 
		this.description, 
		this.price, 
		this.specialPrice, 
		this.availableFrom, 
		this.availableTo, 
		this.image, 
		this.variations, 
	});

	factory FeaturedProduct.fromJson(Map<String, dynamic> json) {
		return FeaturedProduct(
			id: json['id'] as int?,
			name: json['name'] as String?,
			sku: json['sku'] as String?,
			categoryId: json['category_id'] as String?,
			categoryName: json['category_name'] as String?,
			isVeg: json['is_veg'] as String?,
			description: json['description'] as String?,
			price: json['price'] as String?,
			specialPrice: json['special_price'] ,
			availableFrom: json['available_from'] as String?,
			availableTo: json['available_to'] as String?,
			image: json['image'] as String?,
			variations: json['variations'] as List<dynamic>?,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'sku': sku,
				'category_id': categoryId,
				'category_name': categoryName,
				'is_veg': isVeg,
				'description': description,
				'price': price,
				'special_price': specialPrice,
				'available_from': availableFrom,
				'available_to': availableTo,
				'image': image,
				'variations': variations,
			};
}
