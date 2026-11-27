
import 'package:flutter/material.dart';

class RoomItem {
  String name;
  String details;
  String bedInfo;
  double roomPrice;
  ImageProvider image;
  bool isExpanded;

  RoomItem({
    required this.name,
    required this.details,
    required this.bedInfo,
    required this.roomPrice,
    required this.image,
    this.isExpanded = false,
  });
}

class RoomList extends StatefulWidget {
  const RoomList({super.key});

  @override
  State<RoomList> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomList> {

  double price = 0;

  Map<String, bool> extras = {
    'Breakfast': false,
    'Airport Pickup': false,
    'Spa Access': false,
  };

  String roomView = 'City View';

  List<RoomItem> rooms = [
    RoomItem(
      name: "King Room",
      details: "Large bed, free breakfast, sea view, free parking",
      bedInfo: "1 King Bed",
      roomPrice: 380,
      image: const AssetImage('assets/images/king_room.jpg'),
    ),

    RoomItem(
      name: "Double Bed Room",
      details: "Two beds, city view, balcony, swimming pool",
      bedInfo: "2 Single Beds",
      roomPrice: 300,
      image: const AssetImage('assets/images/double_bed.jpg'),
    ),

    RoomItem(
      name: "Family Room",
      details: "Two bedrooms, living room, kitchen, Wi-Fi",
      bedInfo: "2 Queen Beds + Sofa Bed",
      roomPrice: 550,
      image: const AssetImage('assets/images/family_room.png'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hotel Booking Application",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),

      body: Container(
        color: Colors.pink[200],

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Room Preferences
                Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Room Preferences",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),

                        const SizedBox(height: 15),

                        // Price Preference
                        Text(
                          "Price Preference: RM${price.toInt()}",
                          style: TextStyle(
                            color: Colors.green[700],
                          ),
                        ),

                        Slider(
                          activeColor: Colors.pink[200],
                          value: price,
                          min: 0,
                          max: 1000,
                          divisions: 10,
                          label: "RM${price.toInt()}",
                          onChanged: (value) {
                            setState(() => price = value);
                          },
                        ),

                        const Divider(),

                        // Extras
                        Text(
                          "Additional Facilities",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),

                        Column(
                          children: extras.keys.map((extra) {
                            return CheckboxListTile(
                              title: Text(extra),
                              activeColor: Colors.pink[200],
                              value: extras[extra],
                              contentPadding: EdgeInsets.zero,
                              onChanged: (bool? val) {
                                setState(() {
                                  extras[extra] = val!;
                                });
                              },
                            );
                          }).toList(),
                        ),

                        const Divider(),

                        // Room View
                        Text(
                          "Room View",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),

                        Column(
                          children: [
                            'City View',
                            'Sea View',
                            'No Preference'
                          ].map((view) {
                            return RadioListTile<String>(
                              title: Text(view),
                              activeColor: Colors.pink[200],
                              value: view,
                              groupValue: roomView,
                              contentPadding: EdgeInsets.zero,
                              onChanged: (val) {
                                setState(() {
                                  roomView = val!;
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Available Room Types
                Card(
                  color: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Available Room Types",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Room List
                        ...rooms.map((room) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),

                            child: ExpansionTile(
                              initiallyExpanded: room.isExpanded,

                              onExpansionChanged: (expanded) {
                                setState(() {
                                  room.isExpanded = expanded;
                                });
                              },

                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: room.image,
                                  width: 100,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              title: Text(
                                room.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700],
                                ),
                              ),

                              subtitle: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    room.details,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    "RM${room.roomPrice.toInt()}/night",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[700],
                                    ),
                                  ),
                                ],
                              ),

                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  color: Colors.green[200],

                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        "Bed Information: ${room.bedInfo}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[700],
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      Text(room.details),

                                      const SizedBox(height: 10),

                                      Text(
                                        "Room Price: RM${room.roomPrice.toInt()}/night",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[700],
                                        ),
                                      ),

                                      const SizedBox(height: 15),

                                      SizedBox(
                                        width: double.infinity,

                                        child: ElevatedButton(
                                          style:
                                          ElevatedButton.styleFrom(
                                            backgroundColor:
                                            Colors.pink[50],
                                            shape:
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                          ),

                                          onPressed: () {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "${room.name} Reserved Successfully!",
                                                ),
                                              ),
                                            );
                                          },

                                          child: const Text(
                                            "Select",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
