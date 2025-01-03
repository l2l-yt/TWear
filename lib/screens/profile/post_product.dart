import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twear/core/theme/theme.dart';
import 'package:twear/core/utils/get_theme_state.dart';
import 'package:twear/core/utils/screen_size.dart';
import 'package:twear/core/utils/tmp_pjms.dart';
import 'package:twear/models/product_model.dart';
import 'package:twear/screens/global_widgets/glowing_container.dart';
import 'package:twear/screens/global_widgets/navbar.dart';
import 'package:twear/screens/global_widgets/prime_button.dart';
import 'package:twear/screens/profile/widgets/editor.dart';
import 'package:twear/screens/profile/widgets/img_pick_btn.dart';
import 'package:twear/screens/profile/widgets/product_form.dart';
import 'package:twear/screens/profile/widgets/section_builder.dart';

class PostProduct extends StatefulWidget {
  const PostProduct({super.key});

  @override
  State<PostProduct> createState() => _PostProductState();
}

class _PostProductState extends State<PostProduct> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _pgScrollController = ScrollController();
  final QuillController _editorController = QuillController.basic();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController deliveryChargesController =
      TextEditingController();
  final TextEditingController brandNameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final GlobalKey formKey = GlobalKey<FormState>();
  bool _isEditorActive = false;
  final _focusNode = FocusNode();
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile> images = [];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isEditorActive = !_isEditorActive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = getScreenSize(context).first;
    final height = getScreenSize(context).elementAt(1);
    final CTheme themeMode = getThemeMode(context);
    return Scaffold(
      backgroundColor: themeMode.backgroundColor,
      appBar:
          NavBar(themeMode: themeMode, scrollController: _pgScrollController),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                const SizedBox(height: 16),
                buildSection(
                    themeMode: themeMode,
                    sectionTitle: "Product Info",
                    items: []),
                const SizedBox(height: 6),
                SizedBox(
                  width: width * .7,
                  child: ProductForm(
                    themeMode: themeMode,
                    formKey: formKey,
                    productNameController: productNameController,
                    priceController: priceController,
                    discountController: discountController,
                    stockController: stockController,
                    deliveryChargesController: deliveryChargesController,
                    brandNameController: brandNameController,
                    categoryController: categoryController,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: width * .7,
                  height: height * .6,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _isEditorActive
                            ? themeMode.borderColor2 ?? Colors.red
                            : themeMode.borderColor ?? Colors.red,
                        width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: DescriptionEditor(
                      focusNode: _focusNode,
                      themeMode: themeMode,
                      editorController: _editorController,
                      scrollController: _scrollController),
                ),
                QuillToolbar.simple(
                  controller: _editorController,
                  configurations: QuillSimpleToolbarConfigurations(
                    multiRowsDisplay: true,
                    showBackgroundColorButton: true,
                    showUndo: true,
                    showRedo: true,
                    showListNumbers: true,
                    showCodeBlock: true,
                    showQuote: true,
                    showDirection: true,
                    showSearchButton: false,
                    showFontSize: true,
                    dialogTheme: QuillDialogTheme(
                        labelTextStyle:
                            TextStyle(color: themeMode.primTextColor),
                        buttonTextStyle:
                            TextStyle(color: themeMode.primTextColor),
                        buttonStyle: ButtonStyle(
                            textStyle: WidgetStateProperty.resolveWith((_) =>
                                TextStyle(color: themeMode.primTextColor)))),
                    buttonOptions: QuillSimpleToolbarButtonOptions(
                      base: QuillToolbarBaseButtonOptions(
                        iconTheme: QuillIconTheme(
                          iconButtonSelectedData:
                              IconButtonData(color: themeMode.primTextColor),
                          iconButtonUnselectedData:
                              IconButtonData(color: themeMode.primTextColor),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  children: [
                    if (images.length < 6)
                      ImagesButton(
                          onpress: () async {
                            images =
                                await _imagePicker.pickMultiImage(limit: 6);
                          },
                          themeMode: themeMode),
                    ...images.map((element) => glowingContainer(
                        child: Image.asset(element.path), themeMode: themeMode))
                  ],
                ),
                PrimeButton(
                    action: () {
                      writeData(
                          location: "products.json",
                          data: Product(
                                  name: productNameController.text,
                                  price: double.parse(priceController.text),
                                  images: [],
                                  stock: int.parse(stockController.text),
                                  details: _editorController.document
                                      .toDelta()
                                      .toJson()
                                      .toString(),
                                  delivery: deliveryChargesController.text,
                                  company: brandNameController.text,
                                  category: '')
                              .toMap());
                    },
                    themeMode: themeMode,
                    width: width * .2,
                    child: Text(
                      "Post Product",
                      style: TextStyle(color: themeMode.primTextColor),
                    )),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
