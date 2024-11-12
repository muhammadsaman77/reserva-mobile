class BookingData {
  final int id;
  final String image;
  final String name;
  final String price;
  final String date;

  BookingData(
      {
        required this.id,
        required this.image,
      required this.date,
      required this.name,
      required this.price});
}

List<BookingData> bookingData = [
  BookingData(
      id: 1,
      image: 'assets/images/Property1.jpg',
      name: 'The Grand Hotel',
      price: '250',
      date: "12-02-2022 - 14-02-2022"),
  BookingData(
    id: 2,
      image: 'assets/images/Property2.jpg',
      name: 'The Grand Hotel',
      price: '250',
      date: "12-02-2022 - 14-02-2022")
,
  BookingData(
    id : 3,
      image: 'assets/images/Property3.jpg',
      name: 'The Grand Hotel',
      price: '250',
      date: "12-02-2022 - 14-02-2022")
,  BookingData(
    id : 4,
      image: 'assets/images/Property4.jpg',
      name: 'The Grand Hotel',
      price: '250',
      date: "12-02-2022 - 14-02-2022")

];
