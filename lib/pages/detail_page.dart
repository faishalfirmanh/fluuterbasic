import 'package:flutter/material.dart';
import 'package:flutterkos/models/space.dart';
import 'package:flutterkos/pages/error_page.dart';
import 'package:flutterkos/widget/facility_item.dart';
import 'package:flutterkos/widget/rating_item.dart';



import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class DetailPage extends StatefulWidget{


  

  final Space space;

  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  bool isLove  = false;

  Widget build(BuildContext context) {

    launchUrl(String url) async{
    if( await canLaunch(url))
    {
      launch(url);
    }
    else
    {
      //throw(url);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>ErrorPage(),
      ),
      );
    }
  }

  Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Konfirmasi Panggilan'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Apakah anda yakin ingin memesan penginapan ini ?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('ya tentu'),
            onPressed: () {
             // Navigator.of(context).pop();
              launch('tel:${widget.space.phone}');
            },
          ),
          TextButton(
            child: Text('Tidak jadi'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        
      );
    },
  );
}

    return Scaffold(
      backgroundColor: putih,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(widget.space.imgUrl,
            width: MediaQuery.of(context).size.width,
            height:350,
            fit:BoxFit.cover
            ),
            ListView(
              children: [
                SizedBox(
                  height:328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width, //lebar mengikuti layar device,
                 // height: 100,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(29),
                    ),
                    color: putih
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:30
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${widget.space.name}',
                                style: blackTextStyle.copyWith(
                                  fontSize:22
                                ),
                                ),
                                SizedBox(
                                 height: 2,
                                ),
                                 Text.rich(
                                  TextSpan(
                                    text: '${widget.space.price} \$',
                                    style:purpleTextStyle.copyWith(
                                      fontSize:16
                                    ),
                                    children:[
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize:16
                                        )
                                      ),
                                    ]
                                  )
                                ),
                              ],
                            ),
                            Row(
                              children: [1,2,3,4,5].map((index){
                                return Container(
                                  margin: EdgeInsets.only(
                                    left:2
                                  ),
                                  child: RatingItem(
                                    index:index,
                                    rating:widget.space.rating
                                  )
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                      //note MAIN FACILITIES
                      SizedBox(
                        height:30,
                      ),
                       Padding(
                        padding: EdgeInsets.only(
                          left:edge,
                        ),
                        child: Text(
                          "Main Facilities",
                          style: regularTextStyle.copyWith(
                            fontSize:16,
                          ),
                        ),
                      ),
                      SizedBox( //UNTUK MAIN FACILITIES
                        height:12
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:edge,
                        ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                name: ' kitchen',
                                imgUrl: 'assets/001-dapur.png',
                                numberItem: widget.space.numberOfKitchen,
                              ),
                              FacilityItem(
                                 name: ' bedroom',
                                imgUrl: 'assets/002-double-bed.png',
                                numberItem: widget.space.numberOfBethrum,
                              ),
                              FacilityItem(
                                 name: ' Big lemary',
                                imgUrl: 'assets/003-cupboard.png',
                                numberItem: widget.space.numberOfCupboard
                              ),
                            ],
                          )
                      ),
                      SizedBox(
                        height:30
                      ),
                      //note : PHOTOS KAMAR
                      Padding(
                        padding: EdgeInsets.only(
                          left:edge,
                        ),
                        child: Text(
                          "Photos",
                          style: regularTextStyle.copyWith(
                            fontSize:16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height:12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: 
                          widget.space.photos.map((e){
                            return Container(
                              margin: EdgeInsets.only( left: 24),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network( 
                                  e,
                                    width:110, 
                                    height:88,
                                    fit:BoxFit.cover
                                ),
                              ),
                            );
                          }).toList()
                        )
                      ),
                      //Location
                      SizedBox(
                        height: 30,
                      ),
                       Padding(
                        padding: EdgeInsets.only(
                          left:edge,
                        ),
                        child: Text(
                          "Locations",
                          style: regularTextStyle.copyWith(
                            fontSize:16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height:6
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal:edge),
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${widget.space.address} \n ${widget.space.city}',
                              style: greyTextStyle,
                            ),
                           InkWell(
                             onTap:(){
                               launchUrl(widget.space.mapUrl);
                             },
                             child: Image.asset('assets/btn_icon_location.png', width: 40,)
                           )
                          ],
                          ),
                      ),
                      //batas locations
                      SizedBox(
                        height:30
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal:edge
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2* edge),
                        child: RaisedButton(
                          color: ungu,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17)
                          ),
                          onPressed: (){
                            _showMyDialog();
                          },
                          child: Text('Booking now',
                          style: whiteTextStyle.copyWith(
                            fontSize:18
                          ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height:40
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30
              ),
               child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                    'assets/btn_back.png',
                    width:40,
                    ),
                  ),
                 InkWell(
                  onTap: (){
                    setState(() {
                      isLove =  !isLove;
                    });
                  },
                  child: Image.asset(
                  isLove ?  'assets/btn_love_orange.png' :
                  'assets/btn_love.png',
                  width:40,
                  ),
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}