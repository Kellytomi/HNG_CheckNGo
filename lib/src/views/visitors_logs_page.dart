import 'package:checkngo/src/models/visitor.dart';
import 'package:checkngo/src/services/visitors_service.dart';
import 'package:checkngo/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:checkngo/src/services/db_service.dart';
import 'package:google_fonts/google_fonts.dart';

class VisitorsLogsPage extends StatefulWidget {
  const VisitorsLogsPage({super.key});

  @override
  _VisitorsLogsPageState createState() => _VisitorsLogsPageState();
}

class _VisitorsLogsPageState extends State<VisitorsLogsPage> {
  bool _showCheckedIn = true;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<VisitorsService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor\'s Logs'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Open a dialog box that shows CSV Download and JSON Download
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildSwitcher(),
            Expanded(
              child: FutureBuilder<List<Visitor>>(
                future: _showCheckedIn
                    ? controller.getVisitors(SortVisitorBy.checkedIn)
                    : controller.getVisitors(SortVisitorBy.checkedOut),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return _buildDefaultContent(); //replace the _buildDefaultContent() with text below
                    //_buildDefaultContent();  is just a placeholder to test the UI
                    //Once the app is run for the first time, it should show the text below
                    // const Center(child: Text('No visitor'));
                  } else {
                    return _buildVisitorList(snapshot.data!);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitcher() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => _showCheckedIn = true),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Check In',
                  style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    color: _showCheckedIn ? kPrimaryColor : kOnSurfaceColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  width: 100,
                  height: 2,
                  color: _showCheckedIn ? kPrimaryColor : kOnSurfaceColor,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _showCheckedIn = false),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Check Out',
                  style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    color: !_showCheckedIn ? kPrimaryColor : kOnSurfaceColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  width: 100,
                  height: 2,
                  color: !_showCheckedIn ? kPrimaryColor : kOnSurfaceColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//Load visitors from db
  Widget _buildVisitorList(List<Visitor> visitors) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: visitors.length,
        itemBuilder: (context, index) {
          final visitor = visitors[index];
          return Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: kOnSurfaceColor.withOpacity(0.4),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        visitor.fullname,
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          color: const Color.fromARGB(178, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            _showCheckedIn ? 'Checked In' : 'Checked Out',
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              color: _showCheckedIn ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              //This icon navigate you to the screen that display the visitor's details
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: kOnSurfaceColor,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        visitor.phone,
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          color: const Color.fromARGB(143, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _showCheckedIn
                            ? DateFormat('MMM d, yyyy, h:mm a')
                                .format(visitor.checkedInAt)
                            : DateFormat('MMM d, yyyy, h:mm a')
                                .format(visitor.checkedOutAt!),
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

//Placeholder for the screen
  Widget _buildDefaultContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: kOnSurfaceColor.withOpacity(0.4),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ayo Tife',
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          color: const Color.fromARGB(178, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            _showCheckedIn ? 'Checked In' : 'Checked Out',
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              color: _showCheckedIn ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              //This icon navigate you to the screen that display the visitor's details
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: kOnSurfaceColor,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '+2347078453267', //visitor.phone
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          color: const Color.fromARGB(143, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _showCheckedIn
                            ? 'July 29, 2024, 12:55 PM'
                            : 'July 29, 2024, 14:35 PM',
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: kOnSurfaceColor.withOpacity(0.4),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kingsley Etim',
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          color: const Color.fromARGB(178, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            _showCheckedIn ? 'Checked In' : 'Checked Out',
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              color: _showCheckedIn ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              //This icon navigate you to the screen that display the visitor's details
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: kOnSurfaceColor,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '+2347037623221', //visitor.phone
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          color: const Color.fromARGB(143, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _showCheckedIn
                            ? 'July 30, 2024, 13:55 PM'
                            : 'July 29, 2024, 19:35 PM',
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: kOnSurfaceColor.withOpacity(0.4),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hilda John',
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          color: const Color.fromARGB(178, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            _showCheckedIn ? 'Checked In' : 'Checked Out',
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              color: _showCheckedIn ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              //This icon navigate you to the screen that display the visitor's details
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: kOnSurfaceColor,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '+2349164936498', //visitor.phone
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          color: const Color.fromARGB(143, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _showCheckedIn
                            ? 'July 25, 2024, 12:55 PM'
                            : 'July 30, 2024, 21:35 PM',
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: kOnSurfaceColor.withOpacity(0.4),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Naomi Garuba',
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          color: const Color.fromARGB(178, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            _showCheckedIn ? 'Checked In' : 'Checked Out',
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              color: _showCheckedIn ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              //This icon navigate you to the screen that display the visitor's details
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: kOnSurfaceColor,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '+2348123665480', //visitor.phone
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          color: const Color.fromARGB(143, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _showCheckedIn
                            ? 'July 25, 2024, 10:55 PM'
                            : 'July 27, 2024, 19:35 PM',
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: kOnSurfaceColor.withOpacity(0.4),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Esther Binaa',
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          color: const Color.fromARGB(178, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            _showCheckedIn ? 'Checked In' : 'Checked Out',
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              color: _showCheckedIn ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              //This icon navigate you to the screen that display the visitor's details
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: kOnSurfaceColor,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '+2347062810972', //visitor.phone
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          color: const Color.fromARGB(143, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _showCheckedIn
                            ? 'July 20, 2024, 12:55 PM'
                            : 'July 26, 2024, 14:00 PM',
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: kOnSurfaceColor.withOpacity(0.4),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Timothy Ese',
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          color: const Color.fromARGB(178, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            _showCheckedIn ? 'Checked In' : 'Checked Out',
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              color: _showCheckedIn ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              //This icon navigate you to the screen that display the visitor's details
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: kOnSurfaceColor,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '+2348109432781', //visitor.phone
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          color: const Color.fromARGB(143, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _showCheckedIn
                            ? 'July 20, 2024, 13:55 PM'
                            : 'July 24, 2024, 06:00 PM',
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: kOnSurfaceColor.withOpacity(0.4),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Adebola Williams',
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          color: const Color.fromARGB(178, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            _showCheckedIn ? 'Checked In' : 'Checked Out',
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              color: _showCheckedIn ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              //This icon navigate you to the screen that display the visitor's details
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: kOnSurfaceColor,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '+2347036218890', //visitor.phone
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          color: const Color.fromARGB(143, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _showCheckedIn
                            ? 'July 17, 2024, 10:30 PM'
                            : 'July 20, 2024, 09:40 PM',
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey.withOpacity(0.1),
                border: Border.all(
                  color: kOnSurfaceColor.withOpacity(0.4),
                )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amy Okonkwo',
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          color: const Color.fromARGB(178, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            _showCheckedIn ? 'Checked In' : 'Checked Out',
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              color: _showCheckedIn ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              //This icon navigate you to the screen that display the visitor's details
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: kOnSurfaceColor,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '+2348139448091', //visitor.phone
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          color: const Color.fromARGB(143, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        _showCheckedIn
                            ? 'July 10, 2024, 22:00 PM'
                            : 'July 18, 2024, 07:30 PM',
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
