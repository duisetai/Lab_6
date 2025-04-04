import 'package:flutter/material.dart';
import 'package:lab_6/user_info.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для ввода данных
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _storyController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // FocusNode для управления фокусом полей
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _storyFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  bool _obscurePassword = true;

  // Валидация Email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите email';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Неверный формат email';
    }
    return null;
  }

  // Валидация пароля
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите пароль';
    }
    if (value.length < 6) {
      return 'Пароль должен содержать минимум 6 символов';
    }
    return null;
  }

  // Проверка совпадения паролей
  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Пароли не совпадают';
    }
    return null;
  }

  // Валидация номера телефона
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите номер телефона';
    }
    final phoneRegex = RegExp(r'^[0-9]+$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Только цифры разрешены';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserInfoPage(
            name: _nameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Form")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  focusNode: _nameFocus,
                  decoration: InputDecoration(labelText: 'Full Name *'),
                  validator: (value) => value!.isEmpty ? 'Введите имя' : null,
                ),
                TextFormField(
                  controller: _phoneController,
                  focusNode: _phoneFocus,
                  decoration: InputDecoration(labelText: 'Phone Number *'),
                  keyboardType: TextInputType.phone,
                  validator: _validatePhone,
                ),
                TextFormField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  decoration: InputDecoration(labelText: 'Email Address *'),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                TextFormField(
                  controller: _storyController,
                  focusNode: _storyFocus,
                  decoration: InputDecoration(labelText: 'Life Story'),
                  maxLines: 3,
                ),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocus,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password *',
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: _validatePassword,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  focusNode: _confirmPasswordFocus,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(labelText: 'Confirm Password *'),
                  validator: _validateConfirmPassword,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit Form'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
