import 'package:flutter/material.dart';

class RoomItem {
  String name;
  String details;
  String bedInfo;
  ImageProvider image;
  bool isExpanded;
  RoomItem({
    required this.name,
    required this.details,
    required this.bedInfo,
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
  List<RoomItem> rooms = [
    RoomItem(
      name: "King Room",
      details: "Large bed, free breakfast, sea view",
      bedInfo: "1 King Bed",
      image: const AssetImage('assets/images/king_room.jpg'),
    ),
    RoomItem(
      name: "Double Bed Room",
      details: "Two beds, city view, balcony",
      bedInfo: "2 Single Beds",
      image: const AssetImage('assets/images/double_bed.jpg'),
    ),
    RoomItem(
      name: "Family Room",
      details: "Two bedrooms, living room, kitchen",
      bedInfo: "2 Queen Beds + Sofa Bed",
      image: const AssetImage('assets/images/family_room.png'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Your Room", style: TextStyle(
            color: Colors.white
        ),),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: Container(
        color: Colors.pink[200],
        child: ListView(
        padding: const EdgeInsets.all(16),
        children: rooms.map((room) {
          return Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
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
                  width: 120,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                room.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green[700]),
              ),
              subtitle: Text(
                room.details,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.green[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bed Information: ${room.bedInfo}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700]),
                      ),
                      const SizedBox(height: 10),
                      Text(room.details),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink[50],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                  Text("${room.name} Reserved Successfully!")),
                            );
                          },
                          child: const Text("Select", style: TextStyle(color: Colors.black),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),),
    );
  }
}
