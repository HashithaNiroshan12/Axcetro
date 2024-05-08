import 'package:e_commerce_platform/Model/gadget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gadgetsAsync = ref.watch(gadgetsProvider);
    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Gadget Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: gadgetsAsync.when(
        data: (gadgets) {
          return ListView.builder(
            itemCount: gadgets.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  gadgets[index].images[0],
                  width: 50,
                  height: 50,
                ),
                title: Text(gadgets[index].name),
                subtitle: Text(gadgets[index].price),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/detail',
                    arguments: gadgets[index],
                  );
                },
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
