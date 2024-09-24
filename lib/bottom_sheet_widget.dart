import 'package:flutter/material.dart';
import 'package:mini_tugas_filtering/text_style_constant.dart';
import 'package:provider/provider.dart';
import 'package:mini_tugas_filtering/home_view_model.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      height: 450,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              thickness: 2.5,
              indent: 170,
              endIndent: 170,
            ),
            Text(
              'Filter',
              textAlign: TextAlign.start,
              style: TextStyleConstant.poppinsStyle1.copyWith(
                color: Colors.black,
              ),
            ),
            Text(
              'Rentang Harga',
              style: TextStyleConstant.poppinsStyle2,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Min Harga',
                      hintText: viewModel.minPrice > 0
                          ? viewModel.minPrice.toString()
                          : null,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      viewModel.setMinPrice(int.tryParse(value) ?? 0);
                    },
                    style: TextStyleConstant.poppinsStyle2,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Max Harga',
                      hintText: viewModel.maxPrice < double.infinity
                          ? viewModel.maxPrice.toString()
                          : null,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      viewModel.setMaxPrice(
                          double.tryParse(value) ?? double.infinity);
                    },
                    style: TextStyleConstant.poppinsStyle2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text('Rentang Stok', style: TextStyleConstant.poppinsStyle2),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Min Stok',
                      hintText: viewModel.minStock > 0
                          ? viewModel.minStock.toString()
                          : null,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      viewModel.setMinStock(int.tryParse(value) ?? 0);
                    },
                    style: TextStyleConstant.poppinsStyle2,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Max Stok',
                      hintText: viewModel.maxStock < double.infinity
                          ? viewModel.maxStock.toString()
                          : null,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: const OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      viewModel.setMaxStock(
                          double.tryParse(value) ?? double.infinity);
                    },
                    style: TextStyleConstant.poppinsStyle2,
                    // controller: TextEditingController(
                    //   text: viewModel.maxStock.toString(),
                    // ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  hint: Text(
                    'Pilih Kategori',
                    style: TextStyleConstant.poppinsStyle2,
                  ),
                  value: viewModel.selectedCategory,
                  items: [
                    'Kebersihan',
                    'Kesehatan',
                    'Kebutuhan Sehari-hari',
                  ].map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(
                        category,
                        style: TextStyleConstant.poppinsStyle2,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      viewModel.filterByCategory(newValue);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    viewModel.resetFilters();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Reset Filter',
                    style: TextStyleConstant.poppinsStyle2
                        .copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    viewModel.applyFilters();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Terapkan Filter',
                    style: TextStyleConstant.poppinsStyle2
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
