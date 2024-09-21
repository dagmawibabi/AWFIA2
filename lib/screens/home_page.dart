// ignore_for_file: library_private_types_in_public_api

import 'package:awfia2/components/each_crypto.dart';
import 'package:awfia2/screens/ai_chat_page.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  // Sample data for cryptocurrencies (replace with real data later)
  final List<Map<String, dynamic>> _cryptocurrencies = [
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'image': 'https://via.placeholder.com/150x225',
      'price': 50000.0,
      'high24h': 51000.0,
      'low24h': 49000.0,
    },
    {
      'name': 'Ethereum',
      'symbol': 'ETH',
      'image': 'https://via.placeholder.com/150x225',
      'price': 3000.0,
      'high24h': 3100.0,
      'low24h': 2900.0,
    },
    {
      'name': 'Cardano',
      'symbol': 'ADA',
      'image': 'https://via.placeholder.com/150x225',
      'price': 1.20,
      'high24h': 1.25,
      'low24h': 1.15,
    },
    {
      'name': 'Binance Coin',
      'symbol': 'BNB',
      'image': 'https://via.placeholder.com/150x225',
      'price': 400.0,
      'high24h': 410.0,
      'low24h': 390.0,
    },
    {
      'name': 'Solana',
      'symbol': 'SOL',
      'image': 'https://via.placeholder.com/150x225',
      'price': 150.0,
      'high24h': 155.0,
      'low24h': 145.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/logo/afriwork.png",
          width: 100.0,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AIChatPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.auto_awesome_outlined,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.wb_sunny_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search cryptocurrencies',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _cryptocurrencies.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () =>
                      _showBottomSheet(context, _cryptocurrencies[index]),
                  child: EachCrypto(
                    crypto: _cryptocurrencies[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, Map<String, dynamic> crypto) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${crypto['name']} Price Chart',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 7,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 3),
                          const FlSpot(1, 1),
                          const FlSpot(2, 4),
                          const FlSpot(3, 2),
                          const FlSpot(4, 5),
                          const FlSpot(5, 1),
                          const FlSpot(6, 4),
                        ],
                        isCurved: true,
                        color: Colors.blue,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
