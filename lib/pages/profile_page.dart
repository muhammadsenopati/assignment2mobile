import 'package:flutter/material.dart';
import '../services/location_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _currentLocation = 'Detecting location...';
  int? _expandedIndex;

  final List<String> _theaters = [
    'XI CINEMA',
    'PONDOK KELAPA 21',
    'CGV',
    'CINEPOLIS',
    'CP MALL',
    'HERMES',
  ];

  @override
  void initState() {
    super.initState();
    _loadLocation();
  }

  Future<void> _loadLocation() async {
    String city = await LocationService.getCurrentCity();
    setState(() {
      _currentLocation = city.toUpperCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E3350),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'THEATER',
          style: TextStyle(
            color: Color(0xFFFFC107),
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // ======= LOKASI KOTA =======
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on_rounded,
                    size: 26, color: Color(0xFF2E3350)),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _currentLocation,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E3350),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.black54),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ======= LIST TEATER =======
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _theaters.length,
              itemBuilder: (context, index) {
                final bool isExpanded = _expandedIndex == index;
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E8E8),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        setState(() {
                          _expandedIndex = isExpanded ? null : index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _theaters[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF666666),
                                letterSpacing: 0.3,
                              ),
                            ),
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: Color(0xFF666666),
                            ),
                          ],
                        ),
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