import 'package:awfia2/screens/crypto_details.dart';
import 'package:flutter/material.dart';

class EachCrypto extends StatelessWidget {
  final Map<String, dynamic> crypto;

  const EachCrypto({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: Image.network(
          crypto['image'],
          width: 40,
          height: 40,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const CircleAvatar(
            radius: 20,
            child: Icon(Icons.image, size: 24),
          ),
        ),
      ),
      title: Text('${crypto['name']} (${crypto['symbol']})'),
      subtitle: Text(
        'High: \$${crypto['high24h'].toStringAsFixed(2)} | Low: \$${crypto['low24h'].toStringAsFixed(2)}',
      ),
      trailing: Text(
        '\$${crypto['price'].toStringAsFixed(2)}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CryptoDetailsPage(crypto: crypto),
          ),
        );
      },
    );
  }
}
