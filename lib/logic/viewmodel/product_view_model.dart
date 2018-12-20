import 'package:flutter/material.dart';
import 'package:flutter_feed/model/product.dart';

class ProductViewModel {
  List<Product> productsItems;

  ProductViewModel({this.productsItems});

  getProducts() => <Product>[
        Product(
            brand: "Levis",
            description: "Print T-shirt",
            image:
                "https://cdn.pixabay.com/photo/2017/08/05/00/12/people-2581913__340.jpg",
            name: "THE PERFECT",
            price: "\u20B91999",
            rating: 4.0,
            colors: [
              ProductColor(
                color: Colors.red,
                colorName: "Red",
              ),
              ProductColor(
                color: Colors.green,
                colorName: "Green",
              ),
              ProductColor(
                color: Colors.blue,
                colorName: "Blue",
              ),
              ProductColor(
                color: Colors.cyan,
                colorName: "Cyan",
              )
            ],
            quantity: 0,
            sizes: ["S", "M", "L", "XL"],
            totalReviews: 170),
        Product(
            brand: "adidas Performance",
            description: "Pool sliders",
            image:
                "https://image.shutterstock.com/image-photo/suited-man-posing-260nw-380188990.jpg",
            name: "AQUALETTE",
            price: "\u20B93299",
            rating: 5.0,
            totalReviews: 10),
        Product(
            brand: "Produkt",
            description: "Men's Shirt",
            image:
                "https://cdn.pixabay.com/photo/2017/03/24/19/48/jeans-2172032__340.jpg",
            name: "ROBI CHECK",
            price: "\u20B91649",
            rating: 4.5,
            totalReviews: 0),
        Product(
            brand: "adidas Originals",
            description: "Hoodie",
            image:
                "https://cdn.pixabay.com/photo/2017/08/05/00/12/people-2581913__340.jpg",
            name: "TREF OVER HOOD",
            price: "\u20B9349",
            rating: 4.0,
            totalReviews: 5),
        Product(
            brand: "ION",
            description: "Hydration rucksack",
            image:
                "https://image.shutterstock.com/image-photo/young-man-wearing-white-blank-260nw-328594940.jpg",
            name: "BACKPACK VILLAIN 4",
            price: "\u20B9699",
            rating: 4.8,
            totalReviews: 12),
        Product(
            brand: "Diesel",
            description: "Straight leg jeans",
            image:
                "https://mosaic01.ztat.net/vgs/media/pdp-gallery/DI/12/2G/0H/5K/11/DI122G0H5-K11@10.jpg",
            name: "THYTAN",
            price: "\u20B9839",
            rating: 4.2,
            totalReviews: 28),
        Product(
            brand: "YOURTURN",
            description: "Watch in budget",
            image:
                "https://cdn.pixabay.com/photo/2017/11/02/14/26/model-2911330__340.jpg",
            name: "Watch",
            price: "\u20B91199",
            rating: 4.7,
            totalReviews: 120),
        Product(
            brand: "Vero Moda",
            description: "Day dress - black/off",
            image:
                "https://cdn.pixabay.com/photo/2016/03/27/22/05/businessman-1284463__340.jpg",
            name: "VMKANA",
            price: "\u20B92549",
            rating: 4.0,
            totalReviews: 33),
        Product(
            brand: "ONLY",
            description: "A-line skirt",
            image:
                "https://image.shutterstock.com/image-photo/young-man-wearing-white-blank-260nw-328594940.jpg",
            name: "THAI FRILL",
            price: "\u20B91299",
            rating: 4.4,
            totalReviews: 44),
        Product(
            brand: "MAI PIÙ SENZA",
            description: "Awesome Heels",
            image:
                "https://mosaic01.ztat.net/vgs/media/pdp-zoom/M6/61/1B/02/9A/11/M6611B029-A11@13.jpg",
            name: "HIGH HEELS",
            price: "\u20B9599",
            rating: 4.1,
            totalReviews: 22),
        Product(
            brand: "Vero Moda",
            description: "Day dress - black/off",
            image:
                "https://cdn.pixabay.com/photo/2016/03/27/22/05/businessman-1284463__340.jpg",
            name: "VMKANA",
            price: "\u20B92549",
            rating: 4.0,
            totalReviews: 33),
        Product(
            brand: "Diesel",
            description: "Straight leg jeans",
            image:
                "https://mosaic01.ztat.net/vgs/media/pdp-gallery/DI/12/2G/0H/5K/11/DI122G0H5-K11@10.jpg",
            name: "THYTAN",
            price: "\u20B9839",
            rating: 4.2,
            totalReviews: 28),
        Product(
            brand: "adidas Performance",
            description: "Pool sliders",
            image:
                "https://image.shutterstock.com/image-photo/suited-man-posing-260nw-380188990.jpg",
            name: "AQUALETTE",
            price: "\u20B93299",
            rating: 5.0,
            totalReviews: 10),
        Product(
            brand: "Produkt",
            description: "Men's Shirt",
            image:
                "https://cdn.pixabay.com/photo/2017/03/24/19/48/jeans-2172032__340.jpg",
            name: "ROBI CHECK",
            price: "\u20B91649",
            rating: 4.5,
            totalReviews: 0),
        Product(
            brand: "adidas Originals",
            description: "Hoodie",
            image:
                "https://cdn.pixabay.com/photo/2017/08/05/00/12/people-2581913__340.jpg",
            name: "TREF OVER HOOD",
            price: "\u20B9349",
            rating: 4.0,
            totalReviews: 5),
        Product(
            brand: "YOURTURN",
            description: "Watch in budget",
            image:
                "https://cdn.pixabay.com/photo/2017/11/02/14/26/model-2911330__340.jpg",
            name: "Watch",
            price: "\u20B91199",
            rating: 4.7,
            totalReviews: 120),
        Product(
            brand: "ION",
            description: "Hydration rucksack",
            image:
                "https://image.shutterstock.com/image-photo/young-man-wearing-white-blank-260nw-328594940.jpg",
            name: "BACKPACK VILLAIN 4",
            price: "\u20B9699",
            rating: 4.8,
            totalReviews: 12),
        Product(
            brand: "Produkt",
            description: "Men's Shirt",
            image:
                "https://cdn.pixabay.com/photo/2017/03/24/19/48/jeans-2172032__340.jpg",
            name: "ROBI CHECK",
            price: "\u20B91649",
            rating: 4.5,
            totalReviews: 0),
      ];
}
