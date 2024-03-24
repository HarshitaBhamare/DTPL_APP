import 'package:dtpl_app/Components/customtextField.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ComplainMainPage extends StatefulWidget {
  const ComplainMainPage({super.key});

  @override
  State<ComplainMainPage> createState() => _ComplainMainPageState();
}

class _ComplainMainPageState extends State<ComplainMainPage> {
  TextEditingController companyName = TextEditingController();
  TextEditingController purchaseDate = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productCategory = TextEditingController();
  TextEditingController uploadInvoice = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "Complain Box",
          style: TextStyle(
              fontFamily: 'SFCompactRounded',
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: size.height / 90,
              ),
              Container(
                width: size.width / 1.07,
                child: TextField(
                  controller: companyName,
                  decoration: InputDecoration(
                    label: Text(
                      "Company Name",
                      style: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    fillColor: Theme.of(context).colorScheme.secondaryContainer,
                    filled: true,
                  ),
                  style: TextStyle(
                    fontSize: size.height / 60,
                    fontFamily: 'SFCompactRounded',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              Container(
                width: size.width / 1.07,
                child: TextField(
                  controller: purchaseDate,
                  onTap: () {
                    onTapFunction(context: context);
                  },
                  decoration: InputDecoration(
                    // hintText: 'DD-MM-YYYY',
                    label: Text(
                      "Date of Purchase",
                      style: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    fillColor: Theme.of(context).colorScheme.secondaryContainer,
                    filled: true,
                  ),
                  style: TextStyle(
                    fontSize: size.height / 60,
                    fontFamily: 'SFCompactRounded',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              Container(
                width: size.width / 1.07,
                child: TextField(
                  controller: productName,
                  decoration: InputDecoration(
                    label: Text(
                      "Product Name",
                      style: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    fillColor: Theme.of(context).colorScheme.secondaryContainer,
                    filled: true,
                  ),
                  style: TextStyle(
                    fontSize: size.height / 60,
                    fontFamily: 'SFCompactRounded',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  // maxLines: 2,
                ),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              Container(
                width: size.width / 1.07,
                child: TextField(
                  controller: productCategory,
                  decoration: InputDecoration(
                    // hintText: 'DD-MM-YYYY',
                    label: Text(
                      "Category of Product",
                      style: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    fillColor: Theme.of(context).colorScheme.secondaryContainer,
                    filled: true,
                  ),
                  style: TextStyle(
                    fontSize: size.height / 60,
                    fontFamily: 'SFCompactRounded',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              Container(
                width: size.width / 1.07,
                child: TextField(
                  controller: uploadInvoice,
                  decoration: InputDecoration(
                    label: Text(
                      "Upload Invoice",
                      style: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    fillColor: Theme.of(context).colorScheme.secondaryContainer,
                    filled: true,
                  ),
                  style: TextStyle(
                    fontSize: size.height / 60,
                    fontFamily: 'SFCompactRounded',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              Container(
                width: size.width / 1.07,
                child: TextField(
                  controller: description,
                  // textAlign: TextAlign.center,
                  maxLines: 5,
                  decoration: InputDecoration(
                    label: Text(
                      "Description",
                      style: TextStyle(
                          fontFamily: 'SFCompactRounded',
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onBackground,
                          width: 2,
                        )),
                    fillColor: Theme.of(context).colorScheme.secondaryContainer,
                    filled: true,
                  ),
                  style: TextStyle(
                    fontSize: size.height / 60,
                    fontFamily: 'SFCompactRounded',
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 20,
              ),
              InkWell(
                child: Container(
                    child: Center(
                        child: Text(
                      "Submit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SFCompactRounded',
                        fontWeight: FontWeight.w700,
                        fontSize: size.height / 50,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )),
                    height: size.height / 15,
                    width: size.width / 1.4,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 15,
                          offset: Offset(-5, -5),
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: Offset(5, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

TextEditingController datePickerController = TextEditingController();
onTapFunction({required BuildContext context}) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    lastDate: DateTime.now(),
    firstDate: DateTime(2015),
    initialDate: DateTime.now(),
  );
  if (pickedDate == null) return;
  datePickerController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
}
