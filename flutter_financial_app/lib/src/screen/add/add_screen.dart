import 'package:flutter/material.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedItemi;
  final List<String> _item = [
    'cash-back',
    'credit-card',
    'money',
  ];
  final List<String> _itemei = [
    'Income',
    'Expenses',
  ];
  final TextEditingController explain_C = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amount_C = TextEditingController();
  FocusNode amount = FocusNode();
  @override
  void initState() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 120,
              child: main_container(),
            ),
          ],
        ),
      ),
    );
  }

  Container main_container() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 550,
      width: 340,
      child: Column(
        children: [
          const SizedBox(height: 50),
          customDropDown(
              label: 'Name', list: _item, itemSelected: selectedItem),
          const SizedBox(height: 30),
          textField(
            controller: explain_C,
            focusNode: ex,
            label: 'Explain',
          ),
          const SizedBox(height: 30),
          textField(
            controller: amount_C,
            focusNode: amount,
            label: 'Amount',
            keyboardType: TextInputType.number,
          ),
          // ! verify the image
          const SizedBox(height: 30),
          customDropDown(
            label: 'How',
            list: _itemei,
            itemSelected: selectedItemi,
            isName: false,
          ),
          const SizedBox(height: 30),
          date_Time(),
          const Spacer(),
          save(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xff368983),
        ),
        width: 120,
        height: 50,
        child: const Text(
          'Salvar',
          style: TextStyle(
            fontFamily: 'f',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Container date_Time() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: const Color(0xffc5c5c5),
        ),
      ),
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(date.year),
            lastDate: DateTime(2100),
          );
          if (newDate == null) return;
          setState(() {
            date = newDate;
          });
        },
        child: Text(
          'Date: ${date.day} / ${date.month} / ${date.year}',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Padding textField({
    required String label,
    required TextEditingController controller,
    required FocusNode focusNode,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade500,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffc5c5c5),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffc5c5c5),
            ),
          ),
        ),
      ),
    );
  }

  Padding customDropDown(
      {required List<String> list,
      required String label,
      String? itemSelected,
      bool? isName = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: const Color(0xffc5c5c5),
          ),
        ),
        child: DropdownButton<String>(
          value: itemSelected,
          items: list
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Image.asset('images/$e.png'),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          e,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          selectedItemBuilder: (context) {
            return list
                .map(
                  (e) => Row(
                    children: [
                      SizedBox(
                        width: 42,
                        child: Image.asset('images/$e.png'),
                      ),
                      const SizedBox(width: 10),
                      Text(e),
                    ],
                  ),
                )
                .toList();
          },
          hint: Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
          onChanged: (value) {
            setState(() {
              isName == true ? selectedItem = value! : selectedItemi = value!;
            });
          },
        ),
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: const BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Adding',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
