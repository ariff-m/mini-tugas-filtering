import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_tugas_filtering/home_view_model.dart';
import 'package:mini_tugas_filtering/text_style_constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Tugas Mini Filtering',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 400,
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Filter',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        DropdownButton<String>(
                          hint: const Text('Pilih Kategori'),
                          items: [
                            'Kebersihan',
                            'Kesehatan',
                            'Kebutuhan Sehari-hari',
                          ].map((String category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              Provider.of<HomeViewModel>(context, listen: false)
                                  .filterByCategory(newValue);
                            }
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Rentang Harga'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Min Harga',
                                ),
                                onChanged: (value) {
                                  Provider.of<HomeViewModel>(context,
                                          listen: false)
                                      .setMinPrice(double.tryParse(value) ?? 0);
                                },
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Max Harga',
                                ),
                                onChanged: (value) {
                                  Provider.of<HomeViewModel>(context,
                                          listen: false)
                                      .setMaxPrice(double.tryParse(value) ??
                                          double.infinity);
                                },
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Rentang Stok'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Min Stok',
                                ),
                                onChanged: (value) {
                                  Provider.of<HomeViewModel>(context,
                                          listen: false)
                                      .setMinStock(double.tryParse(value) ?? 0);
                                },
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Max Stok',
                                ),
                                onChanged: (value) {
                                  Provider.of<HomeViewModel>(context,
                                          listen: false)
                                      .setMaxStock(double.tryParse(value) ??
                                          double.infinity);
                                },
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<HomeViewModel>(context, listen: false)
                                .applyFilters();
                            Provider.of<HomeViewModel>(context, listen: false)
                                .resetFilters();
                            Navigator.pop(context);
                          },
                          child: const Text('Terapkan Filter'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.filter_alt,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.filteredProducts.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: viewModel.filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = viewModel.filteredProducts[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(
                            product.name[0],
                            style: TextStyleConstant.poppinsStyle1,
                          ),
                        ),
                        title: Text(
                          product.name,
                          style: TextStyleConstant.poppinsStyle2,
                        ),
                        subtitle: Text(
                          'Price: ${product.price} IDR\nStock: ${product.stock}',
                          style: TextStyleConstant.basePoppins,
                        ),
                        trailing: Text(
                          product.category.toString().split('.').last,
                          style: TextStyleConstant.basePoppins,
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                        indent: 13,
                        endIndent: 13,
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
