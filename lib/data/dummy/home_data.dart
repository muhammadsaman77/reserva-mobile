class HotelData{
  int id;
  int price;
  double rating;
  String address;
  bool isFavorite;
  String background;
  String description;
  List<String> previewImages;
  String name;

  HotelData({
    required this.id,
    required this.price,
    required this.address,
    required this.rating,
    required this.background,
    required this.previewImages,
    required this.description,
    required this.name,
    this.isFavorite = false
  });
}

List<HotelData> hotels = [
  HotelData(
    name: "Maxone Hotel",
    price: 200,
    rating: 4.5,
    address: "123 Main St",
    background: "assets/images/Property1.jpg",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    previewImages: ["assets/images/Property1.jpg", "assets/images/Property2.jpg", "assets/images/Property3.jpg", "assets/images/Property4.jpg", "assets/images/Property5.jpg"],
    id: 1,
    isFavorite: false
  ),
  HotelData(
      name: "Aston Hotel",
      price: 200,
      rating: 4.5,
      address: "123 Main St",
      background: "assets/images/Property2.jpg",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      previewImages: ["assets/images/Property1.jpg", "assets/images/Property2.jpg", "assets/images/Property3.jpg", "assets/images/Property4.jpg", "assets/images/Property5.jpg"],
      id: 2,
      isFavorite: true
  ),
  HotelData(
      name: "Swissbel Hotel",
      price: 200,
      rating: 4.5,
      address: "123 Main St",
      background: "assets/images/Property3.jpg",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      previewImages: ["assets/images/Property1.jpg", "assets/images/Property2.jpg", "assets/images/Property3.jpg", "assets/images/Property4.jpg", "assets/images/Property5.jpg"],
      id: 3,
      isFavorite: true
  ),
  HotelData(
      name: "Platinum Hotel",
      price: 200,
      rating: 4.5,
      address: "123 Main St",
      background: "assets/images/Property4.jpg",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      previewImages: ["assets/images/Property1.jpg", "assets/images/Property2.jpg", "assets/images/Property3.jpg", "assets/images/Property4.jpg", "assets/images/Property5.jpg"],
      id: 4,
      isFavorite: false
  ),
  HotelData(
      name: "Merlynn Hotel",
      price: 200,
      rating: 4.5,
      address: "123 Main St",
      background: "assets/images/Property5.jpg",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      previewImages: ["assets/images/Property1.jpg", "assets/images/Property2.jpg", "assets/images/Property3.jpg", "assets/images/Property4.jpg", "assets/images/Property5.jpg"],
      id: 5,
      isFavorite: false
  ),
  HotelData(
      name: "Hilton Hotel",
      price: 200,
      rating: 4.5,
      address: "123 Main St",
      background: "assets/images/Property6.jpg",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      previewImages: ["assets/images/Property1.jpg", "assets/images/Property2.jpg", "assets/images/Property3.jpg", "assets/images/Property4.jpg", "assets/images/Property5.jpg"],
      id: 6,
      isFavorite: false
  ),

];


