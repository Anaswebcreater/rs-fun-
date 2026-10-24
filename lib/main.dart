import 'package:flutter/material.dart';

void main() {
  runApp(const RSFunApp());
}

class RSFunApp extends StatelessWidget {
  const RSFunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RS Fun',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> rooms = [
    {
      'name': 'Friendship Zone',
      'host': 'RS Host',
      'users': 12,
      'icon': Icons.favorite,
      'color': Color(0xFF8B5CF6),
    },
    {
      'name': 'Music Lounge',
      'host': 'Music Lover',
      'users': 8,
      'icon': Icons.music_note,
      'color': Color(0xFFEC4899),
    },
    {
      'name': 'Chill & Chat',
      'host': 'Chill Host',
      'users': 5,
      'icon': Icons.headphones,
      'color': Color(0xFF06B6D4),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF160B08),
      appBar: AppBar(
        backgroundColor: const Color(0xFF241307),
       centerTitle: true,
toolbarHeight: 90,
title: const Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(
      Icons.workspace_premium,
      color: Color(0xFFFFD700),
      size: 28,
    ),
    Text(
      'RS FUN',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
        color: Color(0xFFFFD700),
        fontSize: 22,
      ),
    ),
    Text(
      'VOICE • SOCIAL • TOGETHER',
      style: TextStyle(
        color: Color(0xFFFFD777),
        fontSize: 9,
        letterSpacing: 2,
      ),
    ),
  ],
),
        actions: [
         IconButton(
  onPressed: () {},
  icon: const Icon(
    Icons.search,
    color: Color(0xFFFFD700),
    size: 28,
  ),
),
IconButton(
  onPressed: () {
    setState(() {
      selectedTab = 0;
    });
  },
  icon: const Icon(
    Icons.home,
    color: Color(0xFFFFD700),
    size: 28,
  ),
),
const SizedBox(width: 8),
        ],
      ),
      body: IndexedStack(
        index: selectedTab,
        children: [
          buildHome(),
          buildMessagesPage(),
          buildSimplePage(context,'Wallet', Icons.account_balance_wallet_outlined),
          buildProfilePage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF1D1533),
        indicatorColor: const Color(0xFF6D28D9),
        selectedIndex: selectedTab,
        onDestinationSelected: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Wallet',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildHome() {
   return Stack(
  children: [
    Positioned.fill(
      child: Image.asset(
        'assets/royal_background.png',
        fit: BoxFit.cover,
      ),
    ),
    ListView(
      padding: const EdgeInsets.all(18),
      children: [
        Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 22,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
           colors: [
  Color(0xFF120804),
  Color(0xFF30190B),
  Color(0xFF120804),
],
          ),
          border: Border.all(
            color: const Color(0xFFD6AD55),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Color(0xFFE8C27A),
                size: 32,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 22),
      Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF321609),
                border: Border.all(
                  color: const Color(0xFFFFD777),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  'Mine',
                  style: TextStyle(
                    color: Color(0xFFFFD777),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF8A5B16),
                    Color(0xFFFFD777),
                    Color(0xFF8A5B16),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  'Hot',
                  style: TextStyle(
                    color: Color(0xFF32102B),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 22),
      Row(
        children: [
          Expanded(
            child: _premiumCard(
              '💖',
              'CP',
              const Color(0xFF6B3218),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _premiumCard(
              '🏆',
              'Family',
              const Color(0xFF8A6428),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _premiumCard(
              '👑',
              'Rank',
              const Color(0xFFB88635),
            ),
          ),
        ],
      ),
      const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
           gradient: const LinearGradient(
  colors: [
    Color(0xFF120804),
    Color(0xFF38200D),
    Color(0xFF120804),
  ],
),
border: Border.all(
  color: Color(0xFFFFD700),
  width: 1.5,
),
borderRadius: BorderRadius.circular(22),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WELCOME TO RS FUN',
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 2,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Meet people.\nShare your vibe!',
                style: TextStyle(
                  fontSize: 25,
                  color:  Color(0xFFFFD700),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Your world of voice and friendship'),
            ],
          ),
        ),
        const SizedBox(height: 26),
        const Text(
          'People Online',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 92,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              OnlineUser(icon: Icons.person, color: Colors.pink),
              OnlineUser(icon: Icons.face, color: Colors.deepPurpleAccent),
              OnlineUser(icon: Icons.person_2, color: Colors.teal),
              OnlineUser(icon: Icons.face_3, color: Colors.orange),
              OnlineUser(icon: Icons.person_3, color: Colors.blue),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Voice Rooms',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('See all'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...rooms.map((room) => RoomCard(
              name: room['name'] as String,
              host: room['host'] as String,
              users: room['users'] as int,
              icon: room['icon'] as IconData,
              color: room['color'] as Color,
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => VoiceRoomScreen(
        roomName: room['name'] as String,
        host: room['host'] as String,
        users: room['users'] as int,
        color: room['color'] as Color,
      ),
    ),
  );
              },
            )),
      ],
    ),
  ],
   );
  
  }
   Widget _premiumCard(
    String emoji,
    String title,
    Color color,
  ) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color,
            const Color(0xFF211039),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: const Color(0xFFFFD777),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x553D1C0A),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 38),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFFFD777),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  }
Widget buildSimplePage(BuildContext context, String title, IconData icon,) {
  if (title == 'Wallet') {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'MY WALLET',
            style: TextStyle(
              color: Color(0xFFFFD700),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF542B86),
                  Color(0xFF241044),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFFFD700),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: Color(0xFFFFD700),
                  size: 38,
                ),
                SizedBox(height: 18),
                Text(
                  'Available Balance',
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 8),
                Text(
                  '🪙 0 Coins',
                  style: TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'RS FUN Demo Wallet',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Recharge feature coming soon!',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text('Recharge'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD700),
                    foregroundColor: const Color(0xFF241307),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Transaction history coming soon!',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.history),
                  label: const Text('History'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF542B86),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            'Recent Transactions',
            style: TextStyle(
              color: Color(0xFFFFD700),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFF30203F),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.receipt_long,
                  color: Color(0xFFFFD700),
                  size: 30,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'No transactions yet',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 70, color: Colors.purpleAccent),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'RS FUN',
          style: TextStyle(color: Colors.white54),
        ),
      ],
    ),
  );
}
   Widget buildMessagesPage() {
  return ListView(
    padding: const EdgeInsets.all(16),
    children: [
      const Text(
        'Messages',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        'Your conversations',
        style: TextStyle(color: Colors.white70),
      ),
      const SizedBox(height: 16),

      _messageTile(
        'RS Host',
        'Welcome to RS Fun!',
        Icons.person,
      ),
      _messageTile(
        'Music Lover',
        'Let’s enjoy together!',
        Icons.music_note,
      ),
      _messageTile(
        'Chill Host',
        'Hello! How are you?',
        Icons.headphones,
      ),
    ],
  );
   }
    Widget buildProfilePage() {
  return ListView(
    padding: const EdgeInsets.all(20),
    children: [
      const SizedBox(height: 20),
      const Center(
        child: CircleAvatar(
          radius: 48,
          backgroundColor: Colors.purpleAccent,
          child: Icon(
            Icons.person,
            size: 55,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 12),
      const Center(
        child: Text(
          'RS Fun User',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      const SizedBox(height: 6),
      const Center(
        child: Text(
          'ID: 100001',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      const SizedBox(height: 24),
      _profileOption(Icons.workspace_premium, 'VIP Membership'),
      _profileOption(Icons.account_balance_wallet, 'My Assets'),
      _profileOption(Icons.card_giftcard, 'My Gifts'),
      _profileOption(Icons.family_restroom, 'My Family'),
      _profileOption(Icons.settings, 'Settings'),
      _profileOption(Icons.security, 'Account Security'),
      _profileOption(Icons.feedback, 'Feedback'),
    ],
  );
  }

Widget _profileOption(IconData icon, String title) {
  return Card(
    color: const Color(0xFF211735),
    margin: const EdgeInsets.only(bottom: 10),
    child: ListTile(
      leading: Icon(icon, color: Colors.purpleAccent),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.white70,
      ),
      onTap: () {
       debugPrint('$title abhi setup karna hai');
      },
    ),
  );
}
   
Widget _messageTile(String name, String message, IconData icon) {
  return Card(
    color: const Color(0xFF211735),
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.purpleAccent,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(color: Colors.white70),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.white70,
      ),
      onTap: () {
        debugPrint('Chat selected: $name');
      },
    ),
  );
}


class OnlineUser extends StatelessWidget {
  final IconData icon;
  final Color color;

  const OnlineUser({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 6),
          const Text('Online', style: TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String name;
  final String host;
  final int users;
  final IconData icon;
  final Color color;
final VoidCallback onTap;
  const RoomCard({
    super.key,
    required this.name,
    required this.host,
    required this.users,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('ROOM CLICKED');
        onTap();
      },
      child: Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal:18,
      vertical: 20,
      ),
     decoration: BoxDecoration(
  gradient: const LinearGradient(
    colors: [
      Color(0xFF120804),
      Color(0xFF38200D),
      Color(0xFF1A0D07),
    ],
  ),
  borderRadius: BorderRadius.circular(18),
  border: Border.all(
    color: const Color(0xFFFFD700),
    width: 1.2,
  ),
),
      child: Row(
        children: [
          const Text('Friendship Zone'),
      
          CircleAvatar(
            radius: 28,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD700)
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '$users',
                  style: const TextStyle(
                    color: Color(0xFFD6AD55),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Icon(Icons.headphones, size: 18,
              color: Color(0xFFFFD700),
              ),
              const SizedBox(height: 4),
              Text('$users'),
            ],
          ),
        ],
      ),
    ),
    );
  }
}
class VoiceRoomScreen extends StatefulWidget {
  final String roomName;
  final String host;
  final int users;
  final Color color;

  const VoiceRoomScreen({
    super.key,
    required this.roomName,
    required this.host,
    required this.users,
    required this.color,
  });

  @override
  State<VoiceRoomScreen> createState() => _VoiceRoomScreenState();
}

class _VoiceRoomScreenState extends State<VoiceRoomScreen> {
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF160B30),
      appBar: AppBar(
        backgroundColor: const Color(0xFF241044),
        title: const Row(
  children: [
    Text('👑 Voice Room'),
    SizedBox(width: 8),
    Text(
      'VIP',
      style: TextStyle(
        color: Color(0xFFFFD700),
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),
      ),
    body: Stack(
  children: [
    Positioned.fill(
      child: Image.asset(
        'assets/royal_background.png',
        fit: BoxFit.cover,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 25),
            CircleAvatar(
              radius: 42,
              backgroundColor: widget.color,
              child: const Icon(
                Icons.headphones,
                size: 42,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              widget.roomName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hosted by ${widget.host}',
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF211735),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  const Text(
                    'ROOM MEMBERS',
                    style: TextStyle(
                      letterSpacing: 2,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Icon(
                    Icons.people,
                    size: 38,
                    color: widget.color,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.users} members',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
  padding: const EdgeInsets.all(14),
  decoration: BoxDecoration(
    color: const Color(0x662A1550),
    border: Border.all(
      color: const Color(0xFFFFD700),
      width: 1.5,
    ),
    borderRadius: BorderRadius.circular(18),
  ),
  child: Column(
    children: [
      const Text(
        'VOICE SEATS',
        style: TextStyle(
          color: Color(0xFFFFD700),
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
      const SizedBox(height: 18),
      for (int row = 0; row < 2; row++)
        Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int seat = 0; seat < 5; seat++)
                Column(
                  children: [
                    GestureDetector(
  onTap: () {
   Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) =>
     SeatProfileScreen(
      seatNumber: row * 5 + seat + 1,
    ),
  ),
);
  },
  child:
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: const Color(0xFF4A2B12),
                      child: Icon(
                        Icons.event_seat,
                        color: const Color(0xFFFFD700),
                        size: 30,
                      ),
                    ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${row * 5 + seat + 1}',
                      style: const TextStyle(
                        color:  Color(0xFFFFD700),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 6,
    vertical: 2,
  ),
  decoration: BoxDecoration(
    color: const Color(0xFFFFD700),
    borderRadius: BorderRadius.circular(8),
  ),
  child: const Text(
    'VIP',
    style: TextStyle(
      color: Color(0xFF241307),
      fontSize: 9,
      fontWeight: FontWeight.bold,
    ),
  ),
),
                  ],
                ),
            ],
          ),
        ),
    ],
  ),
),
const SizedBox(height: 20),
          
          
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton.icon(
    onPressed: () {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF241307),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    builder: (giftContext) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '🎁 SEND A GIFT',
              style: TextStyle(
                color: Color(0xFFFFD700),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 22),
            Container(
  width: 280,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color(0xFF4A286E),
        Color(0xFF241307),
      ],
    ),
    border: Border.all(
      color: const Color(0xFFFFD700),
      width: 1.2,
    ),
    borderRadius: BorderRadius.circular(18),
  ),
  child: const Column(
    children: [
      Icon(
        Icons.account_balance_wallet,
        color: Color(0xFFFFD700),
        size: 32,
      ),
      SizedBox(height: 8),
      Text(
        'MY WALLET',
        style: TextStyle(
          color: Color(0xFFFFD700),
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
      SizedBox(height: 8),
      Text(
        '💰 1,000 Coins',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 4),
      Text(
        'Demo Balance',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 12,
        ),
      ),
    ],
  ),
),
const SizedBox(height: 18),
Container(
  width: 280,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: const Color(0xFF321B48),
    border: Border.all(
      color: const Color(0xFFD6AD55),
    ),
    borderRadius: BorderRadius.circular(18),
  ),
  child: const Column(
    children: [
      Text(
        '🏆 GIFTS & ACHIEVEMENTS',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFFFFD700),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text('🌹', style: TextStyle(fontSize: 27)),
              SizedBox(height: 5),
              Text('Rose', style: TextStyle(color: Colors.white70)),
            ],
          ),
          Column(
            children: [
              Text('❤️', style: TextStyle(fontSize: 27)),
              SizedBox(height: 5),
              Text('Heart', style: TextStyle(color: Colors.white70)),
            ],
          ),
          Column(
            children: [
              Text('💎', style: TextStyle(fontSize: 27)),
              SizedBox(height: 5),
              Text('Diamond', style: TextStyle(color: Colors.white70)),
            ],
          ),
          Column(
            children: [
              Text('👑', style: TextStyle(fontSize: 27)),
              SizedBox(height: 5),
              Text('Crown', style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    ],
  ),
),
const SizedBox(height: 18),
Container(
  width: 280,
  padding: const EdgeInsets.all(14),
  decoration: BoxDecoration(
    color: const Color(0xFF241307),
    border: Border.all(
      color: const Color(0xFFD6AD55),
    ),
    borderRadius: BorderRadius.circular(18),
  ),
  child: Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Icon(
          Icons.settings,
          color: Color(0xFFFFD700),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFFD6AD55),
          size: 16,
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Settings feature coming soon!'),
            ),
          );
        },
      ),
      const Divider(color: Color(0xFF6B5430)),
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Icon(
          Icons.security,
          color: Color(0xFFFFD700),
        ),
        title: const Text(
          'Account Security',
          style: TextStyle(color: Colors.white),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFFD6AD55),
          size: 16,
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account Security feature coming soon!'),
            ),
          );
        },
      ),
    ],
  ),
),
const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _giftItem(giftContext, '🌹', 'Rose', '10'),
                _giftItem(giftContext, '❤️', 'Heart', '20'),
                _giftItem(giftContext, '💎', 'Diamond', '100'),
                _giftItem(giftContext, '👑', 'Crown', '500'),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
},
      icon: const Icon(Icons.card_giftcard),
      label: const Text('Gift'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFD700),
        foregroundColor: const Color(0xFF241307),
      ),
    ),
    ElevatedButton.icon(
    onPressed: () {
  final chatController = TextEditingController();
  final messages = <String>[];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF241307),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    builder: (sheetContext) {
      return StatefulBuilder(
        builder: (context, setSheetState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '💬 ROOM CHAT',
                  style: TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: 180,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF382516),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: messages.isEmpty
                      ? const Center(
                          child: Text(
                            'No messages yet',
                            style: TextStyle(color: Colors.white70),
                          ),
                        )
                      : ListView(
                          children: messages
                              .map(
                                (message) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  child: Text(
                                    'You: $message',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: chatController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          hintStyle: const TextStyle(
                            color: Colors.white60,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFD700),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFD700),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {
                        final message = chatController.text.trim();
                        if (message.isNotEmpty) {
                          setSheetState(() {
                            messages.add(message);
                          });
                          chatController.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Color(0xFFFFD700),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  ).whenComplete(() => chatController.dispose());
},
      icon: const Icon(Icons.chat),
      label: const Text('Chat'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFD700),
        foregroundColor: const Color(0xFF241307),
      ),
    ),
  ],
),
const SizedBox(height: 20),
  const Text(
              'Your microphone',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 14),
            GestureDetector(
              onTap: () {
                setState(() {
                  isMuted = !isMuted;
                });
              },
              child: CircleAvatar(
                radius: 35,
                backgroundColor:
                    isMuted ? const Color(0xFF4A2B12)
                    : const Color(0xFFFFD700),
                child: Icon(
                  isMuted ? Icons.mic_off : Icons.mic,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(isMuted ? 'Muted' : 'Mic enabled'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.call_end),
                label: const Text('Leave Room'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD700),
                  foregroundColor: const Color(0xFF241307),
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
        ),
      ),
  ],
    ),
    );
  }
}
class SeatProfileScreen extends StatelessWidget {
  final int seatNumber;

  const SeatProfileScreen({
    super.key,
    required this.seatNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF160B06),
      appBar: AppBar(
        title: const Text('User Profile'),
        backgroundColor: const Color(0xFF241044),
      ),
      body: SingleChildScrollView(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: const Color(0xFFFFD700),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFF321609),
                child: const Icon(
                  Icons.person,
                  size: 55,
                  color: Color(0xFFFFD700),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'RS Fun User $seatNumber',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
  'ID: RS${10000 + seatNumber}',
  style: const TextStyle(
    color: Color(0xFFD6AD55),
    fontSize: 14,
    letterSpacing: 1,
  ),
),
const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                '👑 VIP MEMBER',
                style: TextStyle(
                  color: Color(0xFF241307),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              'Voice Seat: $seatNumber',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Voice Room'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFD700),
                foregroundColor: const Color(0xFF241307),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
Widget _giftItem(
  BuildContext context,
  String emoji,
  String name,
  String price,
)
 {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$name selected! $price coins (demo)')),
      );
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 32)),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            color: Color(0xFFFFD700),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '💰 $price',
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    ),
  );
}