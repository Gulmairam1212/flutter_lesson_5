import 'package:flutter/material.dart';
import 'package:flutter_lesson_5/navigatorApp.dart';
import 'package:flutter_lesson_5/order_success_page.dart';

class MarketApp extends StatelessWidget {
  const MarketApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Map<String, String>> products = List.generate(
    10,
    (i) => {
      'title': 'товар ${i + 1}',
      'desc': 'Описание товара ${i + 1}',
      'image': 'https://picsum.photos/seed/item$i/200/140',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Список товаров'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];

          return Card(
            child: ListTile(
              leading: Image.network(
                item['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),

              title: Text(item['title']!),
             onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder:(_) => ProductDetailPage(
                title: item['title']!,
                 desc: item['desc']!, 
                 imageUrl:item ['image']!,
                 ),
                 ),

              );
             
             }
            ),
          );
        },
      ),
    );
  }
}
class ProductDetailPage extends StatelessWidget{
  final String title;
  final String desc;
  final String imageUrl;
   
   ProductDetailPage({
    required this.title,
    required this.desc,
    required this.imageUrl
   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(title),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl, height: 200, fit:BoxFit.cover),


          SizedBox(height: 12),

           Text(desc),

           SizedBox(
            width: double.infinity,
            child:ElevatedButton(
              onPressed: (){
               Navigator.push(context, 
               MaterialPageRoute(builder: (_) => OrderPage(productTitle:title ),),
               );
              },
               child: Text('Купить')
               ),
           ),

        ],
      ),
      ),
    );
  }
}

class OrderPage extends StatelessWidget{
  final String productTitle;

  OrderPage({required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Заказ и оплата'),
      ),
      body: Padding (
         padding:EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ваш заказ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ), 

           SizedBox(height: 8),
           Text(productTitle),
            SizedBox(height: 24),
            Text('Способ оплаты',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12),
            const  ListTile(
              leading:Icon(Icons.credit_card),
              title:Text('Банковская карта'),
            ),


            SizedBox(height: 16),
           ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title:Text('Электронный кошолек'),

           ),

           SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                 context,
                 MaterialPageRoute(
                  builder:(context) =>  OrderConfirmationPage(productTitle: productTitle,),
                  ),
                );
              }, 
              child: Text('Оплатить')
              ),
           ),

        ],
      ),
      ),
    );
  }
}
