import 'package:flutter/material.dart';

class Login2 extends StatefulWidget {
  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login with Validation'),
      ),
      body: Form(
        child: Column(
          children: [
            Image.asset(
              "assets/icons/butterfly.png",
              height: 100,
              width: 100,
            ),
            const Text(
              "My Login Page",
              style: TextStyle(fontSize: 30, color: Colors.purple),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                validator: (uname) {
                  if (uname!.isEmpty || !uname.contains('@')) {
                    return "Fields are empty or invalid";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15,
                  bottom: 15),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "PassWord",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
                validator: (pass) {
                  if (pass!.isEmpty || pass.length < 6) {
                    return "Fields are empty or password length must be >=6";
                  }else{
                    return null;
                  }
                },
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Login")),
            TextButton(
                onPressed: () {}, child: Text("Not a user?? Register Here!!!"))
          ],
        ),
      ),
    );
  }
}
