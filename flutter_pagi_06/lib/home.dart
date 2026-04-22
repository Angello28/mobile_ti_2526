import 'package:flutter/material.dart';
import 'package:test_flutter/detail.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<String> posts = [
    "https://cms.disway.id/uploads/dabf071c490f9961ee4fb03cbc838f30.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/e/e1/Pemandangan_Gunung_Bromo.jpg",
    "https://i2.wp.com/blog.tripcetera.com/id/wp-content/uploads/2020/10/pulau-padar.jpg",
    "https://www.shutterstock.com/image-photo/beautiful-nature-view-on-sunny-600nw-2658084255.jpg",
    "https://lollytaokta00123.wordpress.com/wp-content/uploads/2013/01/gambar-pemandangan-di-bali-gambar-lukisan-pemandangan-alam-di-bali-yang-indah.jpg",
    "https://awsimages.detik.net.id/community/media/visual/2023/02/08/gambar-pemandangan-7.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ti_a_pagi_4",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 14),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://image.popbela.com/post/20240710/b572a8c9b1d306d24d1dd24b6e41c45d.jpg"),
                  ),
                  Column(
                    children: [
                      Text(
                        "673",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("Posts")
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "9963",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("Followers")
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "79",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text("Following")
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "TI-A Pagi Semester 4 | Official IG Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa."),
              const SizedBox(
                height: 16,
              ),
              const Row(
                children: [
                  Text("Followed by "),
                  Text(
                    "willsen123, ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "abyanoor456, ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "ryanganteng35, ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text("and "),
                  Text(
                    "100 others",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Following"),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Message"),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Email"),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.black)),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 30,
                      ),
                      Text("Highlight 1")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        radius: 30,
                      ),
                      Text("Highlight 2")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.greenAccent,
                        radius: 30,
                      ),
                      Text("Highlight 3")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 30,
                      ),
                      Text("Highlight 4")
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: posts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Detail(url: posts[index])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(posts[index]))),
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
