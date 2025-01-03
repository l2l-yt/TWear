import 'package:flutter/material.dart';
import 'package:twear/core/theme/theme.dart';

class ProductForm extends StatefulWidget {
  final CTheme themeMode;
  final GlobalKey formKey;
  final TextEditingController productNameController;
  final TextEditingController priceController;
  final TextEditingController discountController;
  final TextEditingController stockController;
  final TextEditingController deliveryChargesController;
  final TextEditingController brandNameController;
  final TextEditingController categoryController;

  const ProductForm({
    super.key,
    required this.formKey,
    required this.themeMode,
    required this.productNameController,
    required this.priceController,
    required this.discountController,
    required this.stockController,
    required this.deliveryChargesController,
    required this.brandNameController, required this.categoryController,
  });

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  InputDecoration _fieldDecor({
    required String ht,
    required String hit,
    required IconData icon,
  }) =>
      InputDecoration(
        labelText: hit,
        prefixIcon: Icon(
          icon,
          color: widget.themeMode.iconColor,
        ),
        contentPadding: const EdgeInsets.all(8),
        helperStyle: TextStyle(color: widget.themeMode.primTextColor),
        labelStyle: TextStyle(
          color: widget.themeMode.primTextColor,
          fontSize: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: widget.themeMode.borderColor ?? Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: widget.themeMode.borderColor2 ?? Colors.red,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: widget.themeMode.borderColor ?? Colors.red,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      );

  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName cannot be empty";
    }
    return null;
  }

  String? _validateNumeric(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName cannot be empty";
    }
    if (double.tryParse(value) == null) {
      return "$fieldName must be a valid number";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Form(
      key: widget.formKey,
      child: isWideScreen
          ? GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 fields per row
                crossAxisSpacing: 16,
                mainAxisExtent: 80,
                mainAxisSpacing: 16,
                // childAspectRatio: 3, // Adjust for height/width ratio
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: _buildFormFields(),
            )
          : Column(children: fixColumnView()),
    );
  }

  List<Widget> _buildFormFields() {
    return [
      TextFormField(
        controller: widget.productNameController,
        decoration: _fieldDecor(
          ht: "Product Name",
          hit: "Product Name",
          icon: Icons.text_snippet_outlined,
        ),
        validator: (value) => _validateRequired(value, "Product Name"),
      ),
      TextFormField(
        controller: widget.priceController,
        decoration: _fieldDecor(
          ht: "Price",
          hit: "Product Price",
          icon: Icons.attach_money,
        ),
        keyboardType: TextInputType.number,
        validator: (value) => _validateNumeric(value, "Price"),
      ),
      TextFormField(
        controller: widget.discountController,
        decoration: _fieldDecor(
          ht: "Discount",
          hit: "Discount if any",
          icon: Icons.discount_outlined,
        ),
        keyboardType: TextInputType.number,
        validator: (value) => _validateNumeric(value, "Discount"),
      ),
      TextFormField(
        controller: widget.stockController,
        decoration: _fieldDecor(
          ht: "Stock",
          hit: "Product Quantity",
          icon: Icons.inventory_2_outlined,
        ),
        keyboardType: TextInputType.number,
        validator: (value) => _validateNumeric(value, "Stock"),
      ),
      TextFormField(
        controller: widget.deliveryChargesController,
        decoration: _fieldDecor(
          ht: "Delivery Charges",
          hit: "Delivery charges if applies",
          icon: Icons.local_shipping_outlined,
        ),
        keyboardType: TextInputType.number,
        validator: (value) => _validateNumeric(value, "Delivery Charges"),
      ),
      TextFormField(
        controller: widget.brandNameController,
        decoration: _fieldDecor(
          ht: "Brand Name",
          hit: "Product's Manufacturer Name",
          icon: Icons.factory_outlined,
        ),
        validator: (value) => _validateRequired(value, "Brand Name"),
      ),
      const SizedBox(),
      TextFormField(
        controller: widget.categoryController,
        decoration: _fieldDecor(
          ht: "Category",
          hit: "Category",
          icon: Icons.factory_outlined,
        ),
        validator: (value) => _validateRequired(value, "Category"),
      ),
    ];
  }

  List<Widget> fixColumnView() {
    List<Widget> items = [];

    for (int i = 0; i < _buildFormFields().length; i++) {
      items = [
        ...items,
        _buildFormFields().elementAt(i),
        const SizedBox(
          height: 15,
        )
      ];
    }
    return items;
  }
}
