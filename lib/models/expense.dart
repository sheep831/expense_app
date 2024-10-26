import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../enums/category.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

const categoryIcons = {
  Category.food: Icons.restaurant,
  Category.entertainment: Icons.theaters,
  Category.health: Icons.local_hospital,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.expenses, required this.category});

// define your own alternative constructor function -> filter out all expenses that belongs to the specific category
// 即係你可以用 ExpenseBucket.forCategory() 去開一個instance, 就好似你唔用EdgeInsets原本嘅constructor而用EdgeInsets.symmetric咁
// 咁佢會用個category去filter出個個category嘅expense, assign做expenses, 用嚟create個instance
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      // loop through each element in an iterable collection
      sum += expense.amount;
    }

    return sum;
  }
}
