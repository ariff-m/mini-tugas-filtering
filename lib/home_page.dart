import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_tugas_filtering/product_model.dart';
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
            onPressed: () {},
            icon: const Icon(
              Icons.filter_alt,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                itemCount: viewModel.products.length,
                itemBuilder: (context, index) {
                  final product = viewModel.products[index];
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
                          categoryValues.reverse[product.category]!,
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
