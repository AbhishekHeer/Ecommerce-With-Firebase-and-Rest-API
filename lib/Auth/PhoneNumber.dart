import 'package:flutter/material.dart';

FocusNode _number = FocusNode();
final number = TextEditingController();

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.06,
                ),
                child: TextField(
                  controller: number,
                  focusNode: _number,
                  decoration: InputDecoration(
                      hintText: 'Enter Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(h * 0.02))),
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.4, vertical: h * 0.02),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: w * 0.004),
                        borderRadius: BorderRadius.circular(w * 0.1)),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(w * 0.017),
                        child: Text(
                          'text',
                          style: TextStyle(
                              color: Colors.black, fontSize: h * 0.018),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
