import 'package:flutter/material.dart';
import 'package:pos/pages/billing_page.dart';
import 'package:pos/pages/clients_page.dart';
import 'package:pos/pages/dashboard_page.dart';
import 'package:pos/pages/products_page.dart';

class Page {
  final IconData icon;
  final String label;
  final Widget page;

  Page({required this.icon, required this.label, required this.page});
}

class PageList {
  List<Page> pages = [
    Page(
      icon: Icons.home_rounded,
      label: 'Inicio',
      page: const DashboardPage(),
    ),
    Page(
      icon: Icons.inventory_2_rounded,
      label: 'Productos',
      page: ProductsPage(),
    ),
    Page(
      icon: Icons.person_rounded,
      label: 'Clientes',
      page: ClientsPage(),
    ),
    Page(
      icon: Icons.receipt_rounded,
      label: 'Facturas',
      page: const BillingPage(),
    ),
  ];
}
