import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  final String lable;
  final String hint;
  final FormFieldSetter? onSaved;
  final String  Function(String?)? validator;

  const CustomTextFromField({
    Key? key,
    required this.lable,
    required this.hint,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: TextFormField(
            onSaved: onSaved,
            validator : validator,
            decoration: InputDecoration(
              label: Text(lable),
              //labelText: lable,
              
              
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black26,
              ),
              focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
