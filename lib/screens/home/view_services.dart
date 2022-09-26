import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shea/models/school.dart';

class SheaViewServices extends StatelessWidget {
  final SheaServiceCenter serviceCenter;
  const SheaViewServices({
    super.key,
    this.serviceCenter = const SheaServiceCenter(),
  });

  @override
  Widget build(BuildContext context) {
    void onPress() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 50),
        builder: (context) => (serviceCenter.type == "health")
            ? SheaHealthServicesDialog(serviceCenter: serviceCenter)
            : SheaServicesList(
                height: double.infinity,
                services: serviceCenter.mentalServices,
              ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 1,
          padding: const EdgeInsets.symmetric(
            vertical: 17,
            horizontal: 20,
          ),
          side: const BorderSide(color: Colors.black, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          children: const [
            Text(
              "View Services",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Spacer(),
            HeroIcon(
              HeroIcons.arrowNarrowRight,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class SheaHealthServicesDialog extends StatelessWidget {
  final SheaServiceCenter? serviceCenter;
  const SheaHealthServicesDialog({super.key, this.serviceCenter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 342,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SheaServicesDialogHeader(title: "Services"),
          SheaHealthServicesDialogBody(
            physicalServices: serviceCenter?.physicalServices,
            reproductiveServices: serviceCenter?.reproductiveSrvices,
          ),
        ],
      ),
    );
  }
}

class SheaServicesDialogHeader extends StatelessWidget {
  final String? title;
  const SheaServicesDialogHeader({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            title ?? "",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const HeroIcon(
                HeroIcons.xCircle,
                color: Colors.black,
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SheaHealthServicesDialogBody extends StatelessWidget {
  final List<String>? physicalServices;
  final List<String>? reproductiveServices;

  const SheaHealthServicesDialogBody({
    super.key,
    this.physicalServices = const [],
    this.reproductiveServices = const [],
  });

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      border: Border.all(color: Colors.grey, width: 1),
    );
    const padding = EdgeInsets.all(14);
    double width = 162;
    double height = 170;
    const textStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((context) =>
                    SheaServicesList(services: reproductiveServices)),
              );
            },
            child: Container(
              decoration: boxDecoration,
              padding: padding,
              width: width,
              height: height,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Image.asset("assets/images/health_flag.png"),
                  ),
                  const Text("Sexual and Reproductive Health", style: textStyle)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((context) =>
                    SheaServicesList(services: physicalServices)),
              );
            },
            child: Container(
              decoration: boxDecoration,
              padding: padding,
              width: width,
              height: height,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Image.asset("assets/images/health_heart.png"),
                  ),
                  const Text("Physical Health", style: textStyle)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SheaServicesList extends StatelessWidget {
  final List<String>? services;
  final double height;
  final String? title;

  const SheaServicesList({
    super.key,
    this.services = const [],
    this.height = 426,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(children: [
        SheaServicesDialogHeader(title: title ?? "Services"),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 24, bottom: 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 14),
              itemCount: services?.length ?? 0,
              itemBuilder: ((context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    services![index],
                    style: const TextStyle(color: Colors.black, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
            ),
          ),
        ),
      ]),
    );
  }
}
