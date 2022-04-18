//
//  ContentView.swift
//  CityCar
//
//  Created by 이동준 on 2022/04/13.
//

import CoreData
import SwiftUI
import UIKit

struct CarView: View {
    init() {
        UIScrollView.appearance().bounces = false
    }

    var body: some View {
        ZStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        VStack {
                            TopMenuCarList()
                        }
                    }

                    SortMenu()

                    CarList()
                }
            }

        }.ignoresSafeArea(edges: .top)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
    }
}

struct SortMenu: View {
    var body: some View {
        HStack {
            Text("검색결과")
                .font(.system(size: 16, weight: .regular))
            Text("71건")
                .font(.system(size: 16, weight: .medium))

            Spacer()

            Text("조회 많은순")
                .font(.system(size: 16, weight: .medium))
            Image("sortBlackIcon")

        }.padding(.horizontal, 30.0)
            .padding(.vertical, 10.0)
    }
}

struct CarList: View {
    @State var carIcon = ["genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon", "genesisCar_2_Icon"]
    @State var brandList = ["kiaIcon", "genesisIcon", "genesisIcon", "kiaIcon", "hyundaiIcon", "kiaIcon", "genesisIcon", "genesisIcon", "kiaIcon", "hyundaiIcon", "kiaIcon", "genesisIcon", "genesisIcon", "kiaIcon", "hyundaiIcon"]
    @State var carName = ["2021 K8 하이브리드", "2021 제네시스 G80", "2021 제네시스 G90", "2021 K9", "2020 더 뉴 그랜저", "2021 K8 하이브리드", "2021 제네시스 G80", "2021 제네시스 G90", "2021 K9", "2020 더 뉴 그랜저", "2021 K8 하이브리드", "2021 제네시스 G80", "2021 제네시스 G90", "2021 K9", "2020 더 뉴 그랜저"]

    var body: some View {
        VStack {
            ForEach(carIcon.indices) { i in
                NavigationLink(destination: CarDetailView().navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true).navigationBarTitle("", displayMode: .automatic)) {
                        HStack {
                            Image(carIcon[i]).frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

                            VStack(alignment: .leading) {
                                Image(brandList[i])
                                Text(carName[i])
                                    .font(.system(size: 12, weight: .regular))
                                    .frame(alignment: .leading)
                                    .foregroundColor(Color.black)
                                Text("118,000원~")
                                    .font(.system(size: 13, weight: .bold))
                                    .foregroundColor(Color.black)
                            }.padding(.trailing, 30.0).frame(minWidth: 140.0, alignment: .leading)

                            Text("8건")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(Color.black)
                            Image("rightBlackIcon")
                                .padding(.trailing, 20.0)
                        }
                        .frame(width: 350.0, height: 100.0)
                        .background(Color.white)
                        .cornerRadius(10, corners: .bottomLeft)
                        .cornerRadius(10, corners: .bottomRight)
                        .cornerRadius(10, corners: .topLeft)
                        .cornerRadius(10, corners: .topRight)
                        .shadow(color:
                            Color(hue: 0.0, saturation: 0.023, brightness: 0.814), radius: 10, x: 0, y: 0)
                    }
               
            }
        }
        .padding(.bottom, 10.0)
    }
}

struct TopMenuCarList: View {
    @State var carList = ["ALL", "경형", "준중형", "중형", "대형", "SUV", "승합차", "수용차", "수입차"]
    @State var brandList = ["ALL", "kiaIcon", "hyundaiIcon", "genesisIcon", "samsungIcon"]

    @GestureState private var dragOffset = CGSize.zero
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image("backIcon")
                    }
                    Spacer()
                    Text("서울특별시 도봉구")
                        .foregroundColor(Color.white)
                        .font(.system(size: 19, weight: .bold))
                    Image("sortIcon")
                    Spacer()
                    Image("mapIcon")
                }
                .padding(.top, 20.0)
                .padding(.horizontal, 30.0)

                VStack(alignment: .leading) {
                    Text("차종")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.leading, 30.0)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(carList.indices) { i in

                                VStack {
                                    if i == 0 { Text("ALL").font(.system(size: 17, weight: .medium)) } else { Text(carList[i]).font(.system(size: 17, weight: .regular)) }
                                }.frame(width: 100.0, height: 40.0).background(Color.white)
                                    .cornerRadius(10, corners: .bottomLeft)
                                    .cornerRadius(10, corners: .bottomRight)
                                    .cornerRadius(10, corners: .topLeft)
                                    .cornerRadius(10, corners: .topRight)
                                    .padding(.trailing, i + 1 == carList.count ? 30.0 : 0)
                            }
                        }
                    }.padding(.leading, 30.0)
                }
                .padding(.top, 20.0)

                VStack(alignment: .leading) {
                    Text("브랜드")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.leading, 30.0)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(brandList.indices) { i in

                                VStack {
                                    if i == 0 { Text("ALL").font(.system(size: 17, weight: .medium)) } else { Image(brandList[i]) }
                                }.frame(width: 100.0, height: 40.0).background(Color.white)
                                    .cornerRadius(10, corners: .bottomLeft)
                                    .cornerRadius(10, corners: .bottomRight)
                                    .cornerRadius(10, corners: .topLeft)
                                    .cornerRadius(10, corners: .topRight)
                                    .padding(.trailing, i + 1 == brandList.count ? 30.0 : 0)
                            }
                        }
                    }.padding(.leading, 30.0)
                }
                .padding(.top, 20.0)
            }

            .frame(
                maxWidth: .infinity
            )
            .frame(height: 279.0, alignment: .top)
            .padding(EdgeInsets(top: safeAreaTopInset(), leading: 0, bottom: 0, trailing: 0))
            .background(Color("PrimaryColor"))
            .cornerRadius(10, corners: .bottomLeft)
            .cornerRadius(10, corners: .bottomRight)
        }
    }
}

struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")

        CarView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
    }
}
