import 'package:flutter/material.dart';
import 'package:pizzanove/pages/finalize_purchase_page.dart';

class PizzaMenuItem {
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  PizzaMenuItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class PizzaMenuPage extends StatefulWidget {
  PizzaMenuPage({Key? key}) : super(key: key);

  @override
  _PizzaMenuPageState createState() => _PizzaMenuPageState();
}

class _PizzaMenuPageState extends State<PizzaMenuPage> {
  final List<PizzaMenuItem> savoryPizzas = [
    PizzaMenuItem(
      title: 'Pizza Calabresa',
      description: 'Calabresa com cebola, pimentão e azeitonas',
      imageUrl: 'lib/images/pizza_calabresa.jpg',
      price: 20.0,
    ),
    PizzaMenuItem(
      title: 'Pizza Quatro Queijos',
      description:
          'Quatro tipos de queijo: mussarela, provolone, gorgonzola e parmesão',
      imageUrl: 'lib/images/pizza_quatro_queijos.jpg',
      price: 25.0,
    ),
    PizzaMenuItem(
      title: 'Pizza Frango com Catupiry',
      description: 'Frango desfiado com catupiry e requeijão',
      imageUrl: 'lib/images/pizza_frango_catupiry.jpg',
      price: 23.0,
    ),
    PizzaMenuItem(
      title: 'Pizza Portuguesa',
      description: 'Presunto, linguiça, cebola, tomate e azeitonas',
      imageUrl: 'lib/images/pizza_portuguesa.jpg',
      price: 22.0,
    ),
    // Additional savory pizzas
  ];

  final List<PizzaMenuItem> sweetPizzas = [
    PizzaMenuItem(
      title: 'Pizza de Nuttela',
      description: 'Nutella Original',
      imageUrl: 'lib/images/pizza_nutella.jpg',
      price: 30.0,
    ),
    PizzaMenuItem(
      title: 'Pizza de Banana',
      description: 'Banana, açúcar e canela',
      imageUrl: 'lib/images/pizza_bananachoc.jpg',
      price: 28.0,
    ),
    PizzaMenuItem(
      title: 'Pizza de MorangoChoc',
      description: 'Morango com Chocolate',
      imageUrl: 'lib/images/pizza_morangochoc.jpg',
      price: 32.0,
    ),
    PizzaMenuItem(
      title: 'Pizza M&M',
      description: 'Chocolate Ao Leite com M&M',
      imageUrl: 'lib/images/pizza_mmchoc.jpg',
      price: 29.0,
    ),
  ];

  final List<PizzaMenuItem> drinks = [
    PizzaMenuItem(
      title: 'Coca-Cola',
      description: 'Refrigerante de cola',
      imageUrl: 'lib/images/coca_cola.jpg',
      price: 5.0,
    ),
    PizzaMenuItem(
      title: 'Fanta Laranja',
      description: 'Refrigerante de laranja',
      imageUrl: 'lib/images/fanta_laranja.jpg',
      price: 5.0,
    ),
    PizzaMenuItem(
      title: 'Suco de Laranja',
      description: 'Suco natural de laranja',
      imageUrl: 'lib/images/suco_laranja.jpg',
      price: 6.0,
    ),
    PizzaMenuItem(
      title: 'Água Mineral',
      description: 'Água mineral sem gás',
      imageUrl: 'lib/images/agua_mineral.jpg',
      price: 3.0,
    ),
  ];

  List<PizzaMenuItem> _cartItems = [];
  int _cartItemCount = 0;

  void _addToCart(PizzaMenuItem pizza) {
    setState(() {
      _cartItems.add(pizza);
      _cartItemCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu de Pizzas'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Handle user profile action
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FinalizePurchasePage()),
                  );
                },
              ),
              if (_cartItemCount > 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$_cartItemCount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pizzas Salgadas',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: savoryPizzas
                    .map((pizza) => _buildPizzaCard(context, pizza))
                    .toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Pizzas Doces',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: sweetPizzas
                    .map((pizza) => _buildPizzaCard(context, pizza))
                    .toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Bebidas',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: drinks
                    .map((drink) => _buildPizzaCard(context, drink))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPizzaCard(BuildContext context, PizzaMenuItem pizza) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            pizza.imageUrl,
            width: 100,
            height: 100,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return CircularProgressIndicator();
            },
            errorBuilder: (context, error, stackTrace) =>
                Text('Erro ao carregar imagem'),
          ),
          SizedBox(height: 10),
          Text(
            pizza.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(pizza.description),
          SizedBox(height: 5),
          Text('R\$${pizza.price.toStringAsFixed(2)}'),
          SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              _addToCart(pizza);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${pizza.title} adicionado ao carrinho'),
                ),
              );
            },
            icon: Icon(Icons.add_shopping_cart),
            label: Text('Adicionar ao Carrinho'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
