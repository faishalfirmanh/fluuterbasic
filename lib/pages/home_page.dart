import 'package:flutter/material.dart';
import 'package:flutterkos/models/city.dart';
import 'package:flutterkos/models/space.dart';
import 'package:flutterkos/models/tips.dart';
import 'package:flutterkos/provider/spaces_provider.dart';
import 'package:flutterkos/theme.dart';
import 'package:flutterkos/widget/battom_cart.dart';
import 'package:flutterkos/widget/city_card.dart';
import 'package:flutterkos/widget/space_card.dart';
import 'package:flutterkos/widget/tips_cart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    var spaceProvider = Provider.of<SpacesProvider>(context);
   

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
        children: [
          SizedBox(
            height: edge,
          ),
          // NOTE : TITLE /HEADER 
          Padding(
              padding: EdgeInsets.only(
                left:edge
                ),
              child: Text("Explore Now", style: blackTextStyle.copyWith(
              fontSize:24
            ),),
          ),
          SizedBox(
            height:2
          ),
          Padding(
            padding: EdgeInsets.only(
              left:edge,
            ),
            child: Text(
              "Mencari Kosan yang mantap",
              style: greyTextStyle.copyWith(
                fontSize:16,
              ),
            ),
          ),
          SizedBox(
            height:30 
          ),
           Padding(
            padding: EdgeInsets.only(
              left:edge,
            ),
            child: Text(
              "Popular Cities",
              style: regularTextStyle.copyWith(
                fontSize:16,
              ),
            ),
          ),
          SizedBox(
            height:16
          ),
          // popular CITIZENN
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,//seperti scroview pada react
              children: [
                CityCard(
                  City(
                    id: 1,
                    name: 'Jakarta',
                    imgUrl: 'assets/pic_1.png'
                  )
                ),
                SizedBox(
                  width:20
                ),
                CityCard(
                   City(
                    id: 2,
                    name: 'bandung',
                    imgUrl: 'assets/pic_2.png',
                    isPopular: true
                  )
                ),
                SizedBox(
                  width:20
                ),
                CityCard(
                   City(
                    id: 3,
                    name: 'surabaya',
                    imgUrl: 'assets/pic_3.png'
                  )
                ),
                SizedBox(
                  width:20
                ),

                CityCard(
                   City(
                    id: 4,
                    name: 'palembang',
                    imgUrl: 'assets/pic_4.png'
                  )
                ),
                SizedBox(
                  width:20
                ),

                CityCard(
                   City(
                    id: 5,
                    name: 'aceh',
                    imgUrl: 'assets/pic_5.png'
                  )
                ),
                SizedBox(
                  width:20
                ),

                CityCard(
                   City(
                    id: 6,
                    name: 'bogor',
                    imgUrl: 'assets/pic_6.png'
                  )
                ),
                SizedBox(
                  width:20
                ),
              ],
            ),
          ),
          SizedBox(
            height:30
          ),
          // RECOMANDED SPACE
          
          Padding(
            padding: EdgeInsets.only(
              left:edge,
            ),
            child: Text(
              "Recomended Space",
              style: regularTextStyle.copyWith(
                fontSize:16,
              ),
            ),
          ),
          SizedBox(
            height:16
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge
              ),
              child: FutureBuilder(
                future:  spaceProvider.getRecomandedSpaces(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    List<Space> data = snapshot.data;

                    int indx =0;

                    return Column(
                      children: data.map((e){
                        indx++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: indx == 1 ? 0 : 30,
                          ),
                           child:SpaceCard(e) ,
                          );
                      })
                      .toList(),
                    );
                  } 
                    return Center(child: CircularProgressIndicator(),
                    );
                },
              ),
          ),
          // NOTE TIPS AND GUIDANCE
          // 
          SizedBox(
            height: 30,
            ),
           Padding(
            padding: EdgeInsets.only(
              left:edge,
            ),
            child: Text(
              "Tips and Guidance",
              style: regularTextStyle.copyWith(
                fontSize:16,
              ),
            ),
          ),
          SizedBox(
            height:16
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal:edge
            ),
            child: Column(
             children: [
               SizedBox(
                 height: 20,
               ),
               TipsCard(
                 Tips(
                   imgUrl: 'assets/tips1.png',
                   id: 1,
                   title: 'City Guidlanes',
                   updated: ' 20 Apr'
                 )
               ),
                SizedBox(
                 height: 20,
               ),
               TipsCard(
                 Tips(
                   imgUrl: 'assets/tips2.png',
                   id: 2,
                   title: 'Jakarta Fairhip',
                   updated: ' 11 Dec'
                 )
               ),
             ],
            ),
          ),
          SizedBox(
            height:50 + edge
          ),
          //NOTE BUTTON BATOM NAVIGATOR
        ],
          )
      ),
      floatingActionButton:  Container(  //untuk BOTTOM BATOM TAB tetap
                height: 65,
                width: MediaQuery.of(context).size.width - (2*edge),
                margin: EdgeInsets.symmetric(
                  horizontal:edge
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF6F7F8),
                  borderRadius: BorderRadius.circular(23),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [ 
                      BattomCart(
                        imgUrl: 'assets/battom_icon_1.png',
                        isActive: true,
                      ),
                       BattomCart(
                        imgUrl: 'assets/battom_icon_2.png',
                        isActive: false,
                      ),
                       BattomCart(
                        imgUrl: 'assets/battom_icon_3.png',
                        isActive: false,
                      ),
                       BattomCart(
                        imgUrl: 'assets/battom_icon_4.png',
                        isActive: false,
                      )
                  ],
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}