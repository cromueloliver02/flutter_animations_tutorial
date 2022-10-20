import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../screens/details.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  final GlobalKey _listKey = GlobalKey();
  final List<Widget> _tripTiles = [];

  @override
  void initState() {
    super.initState();
    _addTrips();
  }

  void _addTrips() {
    // get data from db
    List<Trip> trips = [
      Trip(
        title: 'Beach Paradise',
        price: '350',
        nights: '3',
        img: 'beach.png',
      ),
      Trip(
        title: 'City Break',
        price: '400',
        nights: '5',
        img: 'city.png',
      ),
      Trip(
        title: 'Ski Adventure',
        price: '750',
        nights: '2',
        img: 'ski.png',
      ),
      Trip(
        title: 'Space Blast',
        price: '600',
        nights: '4',
        img: 'space.png',
      ),
    ];

    for (var trip in trips) {
      _tripTiles.add(_buildTile(trip));
    }
  }

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(trip: trip),
        ),
      ),
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${trip.nights} nights',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue[300],
            ),
          ),
          Text(
            trip.title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'images/${trip.img}',
          height: 50.0,
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: _listKey,
      itemCount: _tripTiles.length,
      itemBuilder: (ctx, idx) => _tripTiles[idx],
    );
  }
}
