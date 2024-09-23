import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_tugas_filtering/home_view_model.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Provider.of<HomeViewModel>(context, listen: false)
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
                    Provider.of<HomeViewModel>(context, listen: false)
                        .setMaxPrice(double.tryParse(value) ?? double.infinity);
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
                    Provider.of<HomeViewModel>(context, listen: false)
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
                    Provider.of<HomeViewModel>(context, listen: false)
                        .setMaxStock(double.tryParse(value) ?? double.infinity);
                  },
                ),
              ),
            ],
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
          ElevatedButton(
            onPressed: () {
              Provider.of<HomeViewModel>(context, listen: false).applyFilters();

              Navigator.pop(context);
            },
            child: const Text('Terapkan Filter'),
          ),
        ],
      ),
    );
  }
}
