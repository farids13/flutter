import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget drawerList(BuildContext context, {required String username}) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 50,
              ),
              SizedBox(width: 10),
              Text(username),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        ListTile(
          title: Text("Home"),
          iconColor: Colors.blue,
          leading: Icon(Icons.home),
          onTap: () => context.go('/home/$username'),
        ),
        ListTile(
          title: Text("Note"),
          iconColor: Colors.blue,
          leading: Icon(Icons.note),
          onTap: () => context.go('/note/$username'),
        ),
        ListTile(
          title: Text("Tip Calculator"),
          iconColor: Colors.blue,
          leading: Icon(Icons.calculate),
          onTap: () => context.go('/tip/calculator/$username'),
        ),
        ListTile(
          title: Text('QR Barcode Design'),
          iconColor: Colors.blue,
          leading: Icon(Icons.qr_code),
          onTap: () {
            context.go('/qr/$username');
          },
        ),
        ListTile(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(6)),
          iconColor: Colors.blue,
          leading: Icon(Icons.account_circle),
          title: Text('Social Link Profile'),
          onTap: () => context.go('/social/$username'),
        )
      ],
    ),
  );
}
