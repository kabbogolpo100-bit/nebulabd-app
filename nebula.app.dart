import 'package:flutter/material.dart';

void main() {
  runApp(const NebulaApp());
}

class NebulaApp extends StatelessWidget {
  const NebulaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NebulaBD.com',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const SplashScreen(),
    );
  }
}

// ১. স্প্ল্যাশ স্ক্রিন (লোগো সহ)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ৩ সেকেন্ড পর স্বয়ংক্রিয়ভাবে লগইন পেজে চলে যাবে
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.shopping_bag, size: 60, color: Colors.deepPurple),
            ),
            const SizedBox(height: 20),
            const Text(
              'NebulaBD.com',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'আপনার বিশ্বস্ত রিসেলিং প্ল্যাটফর্ম',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

// ২. লগইন স্ক্রিন
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'স্বাগতম!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                const SizedBox(height: 8),
                const Text(
                  'লগইন করতে আপনার মোবাইল নম্বর দিন',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'মোবাইল নম্বর',
                    hintText: '০১৭xxxxxxxx',
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const NebulaHomePage()),
                      );
                    },
                    child: const Text('লগইন করুন', style: TextStyle(fontSize: 16)),
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

// প্রোডাক্ট ডেটা মডেল
class ProductItem {
  final String name;
  final String originalPrice;
  final String discountPrice;
  final String commission;
  final String imageUrl;
  final String description;

  ProductItem({
    required this.name,
    required this.originalPrice,
    required this.discountPrice,
    required this.commission,
    required this.imageUrl,
    required this.description,
  });
}

// ৩. হোম পেজ
class NebulaHomePage extends StatefulWidget {
  const NebulaHomePage({super.key});

  @override
  State<NebulaHomePage> createState() => _NebulaHomePageState();
}

class _NebulaHomePageState extends State<NebulaHomePage> {
  final List<ProductItem> products = [
    ProductItem(
      name: 'প্রিমিয়াম স্মার্ট ওয়াচ',
      originalPrice: '৳ ১,৫০০',
      discountPrice: '৳ ১,২০০',
      commission: '৳ ২৫০',
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
      description: 'উচ্চমানের ডিসপ্লে এবং লং ব্যাটারি লাইফযুক্ত প্রিমিয়াম স্মার্ট ওয়াচ।',
    ),
    ProductItem(
      name: 'ওয়্যারলেস ব্লুটুথ ইয়ারবাড',
      originalPrice: '৳ ১,০০০',
      discountPrice: '৳ ৮৫০',
      commission: '৳ ১৫০',
      imageUrl: 'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb',
      description: 'ক্লিয়ার সাউন্ড কোয়ালিটি এবং নয়েজ ক্যান্সলেশন ফিচারযুক্ত ইয়ারবাড।',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NebulaBD.com'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('রিসেলার কাস্টমার'),
              accountEmail: Text('support@nebulabd.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.deepPurple),
              ),
              decoration: BoxDecoration(color: Colors.deepPurple),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('হোম পেজ'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('কিভাবে রিসেলিং করবেন?'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('রিসেলিং গাইড'),
                    content: const Text('১. আমাদের প্রোডাক্টের ছবি ও দাম আপনার সোশ্যাল মিডিয়ায় শেয়ার করুন।\n২. ক্রেতা অর্ডার কনফার্ম করলে তার ঠিকানা নিন।\n৩. আমাদের অ্যাপ থেকে অর্ডার প্লেস করুন এবং আপনার কমিশন লাভ করুন!'),
                    actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('বুঝেছি'))],
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.headset_mic),
              title: const Text('কাস্টমার সার্ভিস ও সাপোর্ট'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('সাপোর্ট সেন্টার'),
                    content: const Text('কল করুন: 09612345678\nইমেইল: support@nebulabd.com'),
                    actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('ঠিক আছে'))],
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('লগআউট', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            // সার্চ বার
            TextField(
              decoration: InputDecoration(
                hintText: 'পণ্য খুঁজুন...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 12),
            
            // ব্যানার অ্যাড
            Container(
              height: 140,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Colors.deepPurple, Colors.purpleAccent]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'NebulaBD.com মেগা অফার!\nবাম্পার রিসেলিং কমিশন',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 15),
            
            const Text(
              'রিসেলিং প্রোডাক্টসমূহ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // প্রোডাক্ট লিস্ট গ্রিড
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4, offset: const Offset(0, 2))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.imageUrl,
                          height: 90,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            height: 90,
                            color: Colors.grey.shade200,
                            child: const Icon(Icons.image, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            product.originalPrice,
                            style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough, fontSize: 11),
                          ),
                          const SizedBox(width: 6),
                          Text(product.discountPrice, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                      Text('কমিশন: ${product.commission}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 11)),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white, padding: EdgeInsets.zero),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => OrderScreen(product: product)),
                            );
                          },
                          child: const Text('অর্ডার করুন', style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ৪. অর্ডার প্লেস ও হিসাব স্ক্রিন
class OrderScreen extends StatefulWidget {
  final ProductItem product;
  const OrderScreen({super.key, required this.product});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int quantity = 1;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ডিসকাউন্ট মূল্য থেকে সংখ্যা বের করে হিসাব করা
    int unitPrice = int.parse(widget.product.discountPrice.replaceAll(RegExp(r'[^0-9]'), ''));
    int deliveryCharge = 100; // ডেলিভারি চার্জ
    int subTotal = unitPrice * quantity;
    int totalAmount = subTotal + deliveryCharge;

    return Scaffold(
      appBar: AppBar(
        title: const Text('অর্ডার কনফার্ম করুন'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(widget.product.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(widget.product.description, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 15),
            
            // পরিমাণ নির্বাচন
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('পরিমাণ (Quantity):', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        if (quantity > 1) setState(() => quantity--);
                      },
                    ),
                    Text('$quantity', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () => setState(() => quantity++),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            
            // কাস্টমার ইনফো বা লোকেশন ফর্ম
            const Text('গ্রাহক বা ডেলিভারির ঠিকানা:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'গ্রাহকের নাম', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'গ্রাহকের মোবাইল নম্বর', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: addressController,
              maxLines: 2,
              decoration: InputDecoration(labelText: 'সম্পূর্ণ ঠিকানা (লোকেশন, থানা, জেলা)', border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 20),
            
            // হিসাব সেকশন
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade300)),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('প্রোডাক্ট মূল্য:'), Text('৳ $subTotal')]),
                  const SizedBox(height: 6),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('ডেলিভারি চার্জ:'), Text('৳ $deliveryCharge')]),
                  const Divider(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const Text('মোট প্রদেয় টাকা:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('৳ $totalAmount', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple)),
                  ]),
                ],
              ),
            ),
            const SizedBox(height: 25),
            
            // অর্ডার কনফার্ম বাটন
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
                onPressed: () {
                  if (nameController.text.isEmpty || phoneController.text.isEmpty || addressController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('দয়া করে গ্রাহকের নাম, ফোন ও ঠিকানা পূরণ করুন!')),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('অর্ডার সফল হয়েছে!'),
                        content: Text('আপনার অর্ডারটি সফলভাবে গ্রহণ করা হয়েছে।\nমোট বিল: ৳ $totalAmount'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text('ঠিক আছে'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('অর্ডার কনফার্ম করুন', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
