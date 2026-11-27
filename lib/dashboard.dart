
import 'package:flutter/material.dart';
import 'room_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<Dashboard> {

  DateTime? checkInDate;
  DateTime? checkOutDate;

  double adults = 1;

  Future<void> pickCheckInDate() async {
    // Open the date picker dialog when tapped
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkInDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        checkInDate = picked;

        // Reset check-out date if it is earlier than check-in date
        if (checkOutDate != null &&
            checkOutDate!.isBefore(picked)) {
          checkOutDate = null;
        }
      });
    }
  }

  Future<void> pickCheckOutDate() async {
    // Open the date picker dialog when tapped
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: checkOutDate ??
          checkInDate ??
          DateTime.now(),
      firstDate: checkInDate ?? DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        checkOutDate = picked;
      });
    }
  }

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
              children: [

                // Welcome Message
                Text(
                  "Welcome to HY Hotel!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Enjoy a relaxing seaside escape with beautiful ocean views, tropical vibes, and a peaceful beach atmosphere.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 20),

                // Hotel Information Card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,

                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "About HY Hotel",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "HY Hotel offers a comfortable and relaxing stay for guests who want to enjoy a peaceful seaside holiday. Guests can experience beautiful ocean views and a pleasant beach atmosphere.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          "Hotel Facilities",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),

                        const SizedBox(height: 10),

                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [

                            Chip(
                              avatar: const Icon(
                                Icons.wifi,
                                size: 18,
                              ),
                              label: const Text("Free Wi-Fi"),
                              backgroundColor: Colors.pink[50],
                            ),

                            Chip(
                              avatar: const Icon(
                                Icons.pool,
                                size: 18,
                              ),
                              label: const Text("Swimming Pool"),
                              backgroundColor: Colors.pink[50],
                            ),

                            Chip(
                              avatar: const Icon(
                                Icons.beach_access,
                                size: 18,
                              ),
                              label: const Text("Beach View"),
                              backgroundColor: Colors.pink[50],
                            ),

                            Chip(
                              avatar: const Icon(
                                Icons.restaurant,
                                size: 18,
                              ),
                              label: const Text("Restaurant"),
                              backgroundColor: Colors.pink[50],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Hotel Gallery Card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,

                  child: Padding(
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Hotel Gallery",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),

                        const SizedBox(height: 15),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/hotel_picture.jpg',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(height: 15),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/hotel_picture1.png',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Booking Options Card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8,

                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Booking Options",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),

                        const SizedBox(height: 15),

                        // Check-in Date
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          tileColor: Colors.pink[100],

                          leading: Icon(
                            Icons.calendar_today,
                            color: Colors.green[700],
                          ),

                          title: Text(
                            checkInDate == null
                                ? "Select Check-in Date"
                                : "Check-in: ${checkInDate!.day}/${checkInDate!.month}/${checkInDate!.year}",
                          ),

                          trailing: const Icon(Icons.arrow_drop_down),

                          onTap: pickCheckInDate,
                        ),

                        const SizedBox(height: 10),

                        // Check-out Date
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          tileColor: Colors.pink[100],

                          leading: Icon(
                            Icons.calendar_today,
                            color: Colors.green[700],
                          ),

                          title: Text(
                            checkOutDate == null
                                ? "Select Check-out Date"
                                : "Check-out: ${checkOutDate!.day}/${checkOutDate!.month}/${checkOutDate!.year}",
                          ),

                          trailing: const Icon(Icons.arrow_drop_down),

                          onTap: pickCheckOutDate,
                        ),

                        const SizedBox(height: 20),

                        // Adults Slider
                        Text(
                          "Number of Adults: ${adults.toInt()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),

                        Slider(
                          value: adults,
                          min: 1,
                          max: 10,
                          label: adults.toInt().toString(),
                          activeColor: Colors.pink[200],
                          onChanged: (value) {
                            setState(() {
                              adults = value;
                            });
                          },
                        ),

                        const SizedBox(height: 20),

                        // Next Button
                        SizedBox(
                          width: double.infinity,

                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              backgroundColor: Colors.green[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),

                            child: const Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),

                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Reservation Info Saved!")
                                  ),
                              );

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RoomList(),
                                  ),
                                );
                              }
                          ),
                        ),
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
