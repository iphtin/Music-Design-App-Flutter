import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RecentlyWidget extends StatelessWidget {
  const RecentlyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> album = [
     {
      "image": "https://upload.wikimedia.org/wikipedia/en/e/e8/Nailah_Hunter_-_Lovegaze.png",
      "Artist": "Nailah",
      "Album": "Lovegaze"
     },
      {
      "image": "https://upload.wikimedia.org/wikipedia/en/3/37/Sprints_-_Letter_to_Self.png",
      "Artist": "Sprints",
      "Album": "Letter to Self"
     },
    {
      "image": "https://upload.wikimedia.org/wikipedia/en/4/4c/D-Block_Europe_-_Rolling_Stone.png",
      "Artist": "D-Block",
      "Album": "Rolling Stone"
     },
      {
      "image": "https://upload.wikimedia.org/wikipedia/en/6/6e/Kali_Uchis_Orqu%C3%ADdeas.png",
      "Artist": "Kali Uchis",
      "Album": "Orquídeas"
     },
    ];
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: album.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.network(
                  album[index]['image'],
                  width: 80,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        album[index]['Artist'],
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        album[index]['Album'],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
