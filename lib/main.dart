import 'package:audioplayers/audioplayers.dart';
import 'package:fluter_app_song/Components/custom_list_tile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MusicApp extends StatefulWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  _MusicAppState createState() => _MusicAppState();

  

}

class _MusicAppState extends State<MusicApp> {
  //Music List
  List musicList = [
    {
      'title': "Say It.",
      'singer': "ヨルシカ (Yorushika)",
      'url':
          "https://cdn.fbsbx.com/v/t59.3654-21/274436046_348845487137287_7212351619687386446_n.mp3/%E3%83%A8%E3%83%AB%E3%82%B7%E3%82%AB-%E8%A8%80%E3%81%A3%E3%81%A6Music-Video-mp3cut.net.mp3?_nc_cat=106&ccb=1-5&_nc_sid=7272a8&_nc_ohc=HLnhKzXzjYUAX_nnLdP&_nc_ht=cdn.fbsbx.com&oh=03_AVLtryJyQQxahTof-WI4K9C-vPojYf20PT22DCGzu29GzQ&oe=62269611&dl=1",
      'coverUrl':
          "https://c-cl.cdn.smule.com/rs-s78/arr/3b/9f/5623707d-f8d1-49c4-92ab-9d0794afbfe2_1024.jpg",
      'star': 5
    },
    {
      'title': "ねむるまち",
      'singer': "ねむるまち feat.yama",
      'url':
          "https://cdn.fbsbx.com/v/t59.3654-21/274801060_372930671326344_5690369203388338086_n.mp3/%E3%81%AD%E3%82%80%E3%82%8B%E3%81%BE%E3%81%A1-feat-mp3cut.net.mp3?_nc_cat=105&ccb=1-5&_nc_sid=7272a8&_nc_ohc=xVI7m2iqoRoAX9P_MuJ&tn=If31J0UViSKFclFs&_nc_ht=cdn.fbsbx.com&oh=03_AVIz1o0X8S_9Zp09ETWiVADDFfRR-WVD-niKYszNFwkTZA&oe=62267568&dl=1",
      'coverUrl':
          "https://assets.audiomack.com/phototsynthesis/0e9e2393b68e7f2988e81e807fbe0ac6c1517fd89dd544e43c559dc1b6165b04.jpeg?width=1000&height=1000&max=true",
      'star': 3
    },
    {
      'title': "Summertime",
      'singer': "Cinnamon Sevening Cinema",
      'url':
          "https://cdn.fbsbx.com/v/t59.3654-21/275080347_286076003610901_8295898187483016356_n.mp3/cinnamons-evening-cinema-summertime-Official-Music-Video-mp3cut.net.mp3?_nc_cat=106&ccb=1-5&_nc_sid=7272a8&_nc_ohc=U6v8QLrZlacAX8ZB3Rt&_nc_ht=cdn.fbsbx.com&oh=03_AVKi7KV4MCXSpp3qVnVxSZleDZL0TRop1Dq92q0wCNwJcQ&oe=62266E02&dl=1",
      'coverUrl':
          "https://az743702.vo.msecnd.net/cdn/useruploads/jpg_09b09ed4-c45d-4a60-a71d-6657d241be36.jpg",
      'star': 4
    },
    {
      'title': "寄り酔い (和ぬか)",
      'singer': "acoustic arrange ver.ダズビー COVER",
      'url':
          "https://cdn.fbsbx.com/v/t59.3654-21/274801060_364822821943551_861362048909483776_n.mp3/%E5%AF%84%E3%82%8A%E9%85%94%E3%81%84-%E5%92%8C%E3%81%AC%E3%81%8B-acoustic-arrange-ver-mp3cut.net.mp3?_nc_cat=109&ccb=1-5&_nc_sid=7272a8&_nc_ohc=4mIWW5yVH0IAX9M2oWM&_nc_oc=AQnLCR_6gHDEACRFthfFxjtZFwPfe4alrEX6AJ-qcuHAmJKzK2NEFcfCLpMyYXGIyUY&_nc_ht=cdn.fbsbx.com&oh=03_AVLE1d8ELx4TCkY0UQi9AMwzI-e7hJNqFGKjQvxiMEzxAw&oe=622677AD&dl=1",
      'coverUrl':
          "https://i1.sndcdn.com/artworks-NdLy6a3X5cfkYmDw-jHW2vA-t500x500.jpg",
      'star': 5
    },
    {
      'title': "PayPhone",
      'singer': "by Maroon 5",
      'url':
          "https://cdn.fbsbx.com/v/t59.3654-21/274868208_657390982145579_8751459151028864762_n.mp3/Payphone-Maroon-5-ft-mp3cut.net.mp3?_nc_cat=101&ccb=1-5&_nc_sid=7272a8&_nc_ohc=yDA-i5ZvXdkAX8Y11vQ&_nc_ht=cdn.fbsbx.com&oh=03_AVIcAz6EG86VRfqdVHepgBld1dCVcYHgJin22H0RyDo6tQ&oe=62268BD4&dl=1",
      'coverUrl':
          "http://music.mthai.com/app/uploads/2015/05/966309_10151920553963482_55666118_o.jpg",
      'star': 4
    },
    //new
  ];

  //Getting variable
  String cerrentTitle = "";
  String cerrentCover = "";
  String cerrentSinger = "";
  int cerrentStar = 0;
  IconData btnIcon = Icons.play_arrow;

  //get onPressed => null;
  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String cerrentSong = "";

  Duration d = new Duration();
  Duration p = new Duration();

 
  void setSong(){
    setState(() {
      cerrentTitle = musicList[0]['title'];
      cerrentCover = musicList[0]['coverUrl'];
      cerrentSinger = musicList[0]['singer'];
      cerrentStar = musicList[0]['star'];
    });
  }

  

  void playMusic(String url) async {
    if (isPlaying && cerrentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          cerrentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          btnIcon = Icons.pause;
          isPlaying = true;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        d = event;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        p = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "💖My Favorite Song 💕",
          style: TextStyle(
              color: Colors.black, fontFamily: 'fcfriday', fontSize: 32),
        ),
        elevation: 4,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: musicList.length,
                itemBuilder: (context, index) => customListTile(
                      onTap: () {
                        playMusic(musicList[index]['url']);
                        setState(() {
                          cerrentTitle = musicList[index]['title'];
                          cerrentCover = musicList[index]['coverUrl'];
                          cerrentSinger = musicList[index]['singer'];
                          cerrentStar = musicList[index]['star'];
                        });
                      },
                      title: musicList[index]['title'],
                      singer: musicList[index]['singer'],
                      cover: musicList[index]['coverUrl'],
                      star: musicList[index]['star'],
                    )),
          ),
          // fotter => display list song
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Color(0x55212121),
                blurRadius: 16.0,
              )
            ]),
            child: Column(children: [
              Slider.adaptive(
                value: p.inSeconds.toDouble(),
                min: 0.0,
                max: d.inSeconds.toDouble(),
                onChanged: (value) {},
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 15.0, left: 15.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          image: DecorationImage(
                              image: NetworkImage(cerrentCover))),
                    ),
                    // display bar
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cerrentTitle,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            cerrentSinger,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              for (var i = 0; i < cerrentStar; i++)
                                new IconTheme(
                                  data: new IconThemeData(
                                      color: Color.fromARGB(255, 252, 97, 97)),
                                  child: new Icon(
                                    Icons.star,
                                    size: 20,
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                    //onPressed: onPressed, icon: icon
                    IconButton(
                      //onPressed: onPressed, icon: Icon(Icons.play_arrow)
                      onPressed: () {
                        if (isPlaying) {
                          audioPlayer.pause();
                          setState(() {
                            btnIcon = Icons.play_arrow;
                            isPlaying = false;
                          });
                        } else {
                          audioPlayer.resume();
                          setState(() {
                            btnIcon = Icons.pause;
                            isPlaying = true;
                          });
                        }
                      },
                      iconSize: 42.0,
                      icon: Icon(btnIcon),
                    )
                  ], //
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
