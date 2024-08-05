import 'package:flutter/material.dart';

import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/number_field.dart';
import '../widgets/txt_field.dart';

class AddMatchPage extends StatefulWidget {
  const AddMatchPage({super.key});

  @override
  State<AddMatchPage> createState() => _AddMatchPageState();
}

class _AddMatchPageState extends State<AddMatchPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();
  final controller5 = TextEditingController();
  final controller6 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      if (controller1.text.isEmpty) {
        active = false;
      } else if (controller2.text.isEmpty) {
        active = false;
      } else if (controller3.text.isEmpty) {
        active = false;
      } else if (controller4.text.isEmpty) {
        active = false;
      } else if (controller5.text.isEmpty) {
        active = false;
      } else if (controller6.text.isEmpty) {
        active = false;
      } else {
        active = true;
      }
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar('Create new Matches', back: false),
          const CustomAppbar(''),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                const SizedBox(height: 14),
                TxtField(
                  controller: controller1,
                  title: 'Edit name team',
                  red: false,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 14),
                TxtField(
                  controller: controller2,
                  title: 'Edit name team',
                  red: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 36),
                NumberField(
                  controller: controller3,
                  title: 'Team score',
                  red: false,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 14),
                NumberField(
                  controller: controller4,
                  title: 'Team score',
                  red: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 36),
                NumberField(
                  controller: controller5,
                  title: 'Event time',
                  red: false,
                  time: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 14),
                TxtField(
                  controller: controller6,
                  title: 'Event name',
                  red: true,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 40),
                PrimaryButton(
                  title: 'Next',
                  active: active,
                  onPressed: () {},
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
