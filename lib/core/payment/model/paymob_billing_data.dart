class PaymobBillingData {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String apartment;
  final String floor;
  final String street;
  final String building;
  final String shippingMethod;
  final String postalCode;
  final String city;
  final String country;
  final String state;

  PaymobBillingData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.apartment = "NA",
    this.floor = "NA",
    this.street = "NA",
    this.building = "NA",
    this.shippingMethod = "NA",
    this.postalCode = "NA",
    this.city = "NA",
    this.country = "NA",
    this.state = "NA",
  });

  Map<String, String> toMap() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone_number": phone,
      "apartment": apartment,
      "floor": floor,
      "street": street,
      "building": building,
      "shipping_method": shippingMethod,
      "postal_code": postalCode,
      "city": city,
      "country": country,
      "state": state,
    };
  }
}
