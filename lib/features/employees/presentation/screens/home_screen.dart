import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_track_app/features/employees/data/models/employee_model.dart';
import 'package:team_track_app/features/employees/presentation/providers/employees_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<EmployeesProvider>(context, listen: false)
        .eitherFailureOrEmployees();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<EmployeeModel>? employees =
        Provider.of<EmployeesProvider>(context).employees;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: const Text('Team Truck', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: employees?.length ?? 5,
        itemBuilder: (context, index) {
          var employee = employees?[index];

          return ListTile(
            title: Text(employee?.name ?? 'Qwerty'),
          );
        },
      ),
    );
  }
}
