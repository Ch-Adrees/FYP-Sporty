import 'package:flutter/material.dart';

class Ordercard extends StatefulWidget {
  const Ordercard({super.key});

  @override
  State<Ordercard> createState() => _OrdercardState();
}

class _OrdercardState extends State<Ordercard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: kDefaultIconLightColor.withOpacity(0.6),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order No : 1",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFCC5656),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Date:27-12-2000",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFCC5656),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: SizedBox(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                "assets/images/hanan.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Column(
                            children: [
                              Text("Item Name:"),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Yomoloko"),
                            ],
                          ),
                          const Column(
                            children: [
                              Text("Item Price"),
                              SizedBox(
                                height: 5,
                              ),
                              Text("13.33"),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: kDefaultIconDarkColor.withOpacity(0.6),
                        height: 10,
                        thickness: 2,
                      )
                    ],
                  );
                })),
            const SizedBox(
              height: 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Item Quantity:",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 8, 8, 8),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "15",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFCC5656),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Total Bill ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(244, 14, 13, 13),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "2000",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFCC5656),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 10, 5.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 35,
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Accept",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Reject",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
