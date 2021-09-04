import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          if (user!.photoURL != null)
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
          SizedBox(height: 8),
          if (user.displayName != null)
            Text(
              'Name: ' + user.displayName!,
              style: TextStyle(color: Colors.white),
            ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email!,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}













// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:login_signup/provider/google_sign_in.dart';
// import 'package:provider/provider.dart';

// class LoggedInWidget extends StatelessWidget {
//   const LoggedInWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Logged In'),
//         centerTitle: true,
//         actions: [
//           TextButton(
//             child: Text(
//               'Logout',
//               style: TextStyle(color: Colors.black),
//             ),
//             onPressed: () {
//               final provider =
//                   Provider.of<GoogleSignInProvider>(context, listen: false);
//               provider.logout();
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Profile',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(
//               height: 32,
//             ),
//             CircleAvatar(
//               radius: 40,
//               backgroundImage: NetworkImage(user.photoURL!),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               'Name: ' + user.displayName!,
//               style: TextStyle(color: Colors.black, fontSize: 16),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               'Email: ' + user.email!,
//               style: TextStyle(color: Colors.black, fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
