import 'package:flutter/material.dart';
import 'university.dart';
import 'university_detail_screen.dart';

class UniversityListScreen extends StatefulWidget {
  @override
  _UniversityListScreenState createState() => _UniversityListScreenState();
}

class _UniversityListScreenState extends State<UniversityListScreen> {
  final List<University> universities = [
    University(
      photo: 'assets/university1.jpg',
      name: 'Astana Medical University',
      desc: 'Description for Astana Medical University',
      city: 'Nur-Sultan',
      phoneNumber: '8 (7172) 53 94 24',
      universityNumber: '001',
      professions: [
        'B001-Pedagogy and Psychology',
        'B002-Early Childhood Education and Care',
        'B003-Primary Education Pedagogy and Methods',
        'B009-Mathematics Teacher Preparation',
      ],
    ),
    University(
      photo: 'assets/university.jpg',
      name: 'S. Seifullin Kazakh Agrotechnical University',
      desc: 'Description for S. Seifullin Kazakh Agrotechnical University',
      city: 'Nur-Sultan',
      phoneNumber: '8 (7172) 53 94 24',
      universityNumber: '002',
      professions: [
        'Agronomy',
        'Agricultural Engineering',
        'Veterinary Medicine',
        'Forestry',
      ],
    ),
    University(
      photo: 'assets/university.jpg',
      name:
          'Sh. Yessenov Caspian State University of Technologies and Engineering',
      desc:
          'Description for Sh. Yessenov Caspian State University of Technologies and Engineering',
      city: 'Aktau',
      phoneNumber: '8 (7172) 53 94 24',
      universityNumber: '003',
      professions: [
        'Engineering',
        'Computer Science',
        'Business Administration',
        'Civil Engineering',
      ],
    ),
    University(
      photo: 'assets/university.jpg',
      name: 'M. Ospanov West Kazakhstan State Medical University',
      desc:
          'Description for M. Ospanov West Kazakhstan State Medical University',
      city: 'Aktobe',
      phoneNumber: '8 (7172) 53 94 24',
      universityNumber: '004',
      professions: [
        'General Medicine',
        'Dentistry',
        'Pharmacy',
        'Nursing',
      ],
    ),
    University(
      photo: 'assets/university.jpg',
      name: 'Al-Farabi Kazakh National University',
      desc: 'Description for Al-Farabi Kazakh National University',
      city: 'Almaty',
      phoneNumber: '8 (727) 377 33 33',
      universityNumber: '005',
      professions: [
        'Physics',
        'Chemistry',
        'Biology',
        'Mathematics',
      ],
    ),
  ];

  String searchQuery = '';
  String selectedCity = '';

  final List<String> cities = [
    '',
    'Nur-Sultan',
    'Aktau',
    'Aktobe',
    'Almaty',
  ];

  @override
  Widget build(BuildContext context) {
    List<University> filteredUniversities = universities
        .where((uni) =>
            uni.name.toLowerCase().contains(searchQuery.toLowerCase()) &&
            (selectedCity.isEmpty || uni.city == selectedCity))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('УНИВЕРСИТЕТТЕР ТІЗІМІ'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: selectedCity,
                  items: cities.map((city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city.isEmpty ? 'All Cities' : city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value ?? '';
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUniversities.length,
              itemBuilder: (context, index) {
                final university = filteredUniversities[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UniversityDetailScreen(university: university),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    elevation: 5,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      height:
                          130, // Increase the height of the university blocks
                      child: Row(
                        children: [
                          Container(
                            width: 140, // Adjust the width if necessary
                            height: 130, // Match the height of the container
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.asset(
                                university.photo,
                                fit: BoxFit
                                    .cover, // Ensure the image covers the entire container
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  university.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      university.city,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 3),
                                    Text(university.phoneNumber),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RotatedBox(
                                quarterTurns: -1,
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  width: 100,
                                  height: 25,
                                  child: Text(
                                    university.universityNumber,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
// ideal