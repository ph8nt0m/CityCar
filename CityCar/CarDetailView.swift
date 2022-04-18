//
//  CarDetailView.swift
//  CityCar
//
//  Created by 이동준 on 2022/04/18.
//

import CoreData
import SwiftUI
import UIKit

struct CarDetailView: View {
    init() {
        UIScrollView.appearance().bounces = false
    }

    var body: some View {
        ZStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        VStack {
                            TopMenuCarDetail()
                            CarDetailBox()
                        }

                        RentBox()
                        
                        InsuranceBox()
                        
                    }
                }
            }

        }.ignoresSafeArea(edges: .top)
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
    }
}

struct InsuranceBox: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("자차보험")
                    .font(.system(size: 18, weight: .bold))
                Text("요금제보기")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color("PrimaryColor"))
            }

            HStack {
                
                VStack {
                    Text("신청")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Color.white)
                }
                .frame(width: 117.0, height: 40.0)
                .background(Color("PrimaryColor"))
                .cornerRadius(10, corners: .bottomLeft)
                .cornerRadius(10, corners: .topLeft)
                .padding(.trailing, -4)
                
                
                VStack {
                    Text("미신청")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Color.black)
                }
                .frame(width: 117.0, height: 40.0)
                .background(Color.white)
                .padding(.horizontal, -4)
                .shadow(color: Color(hue: 0.0, saturation: 0.014, brightness: 0.864), radius: 10, x: 0, y: 0)
                
                VStack {
                    Text("미신청")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Color.black)
                }
                .frame(width: 117.0, height: 40.0)
                .background(Color.white)
                .cornerRadius(10, corners: .bottomRight)
                .cornerRadius(10, corners: .topRight)
                .padding(.leading, -4)
                .shadow(color: Color(hue: 0.0, saturation: 0.014, brightness: 0.864), radius: 10, x: 0, y: 0)

            }
            .frame(maxWidth: 350.0)
            
        }
        .padding(.top, 650.0)
        .padding(.horizontal, 20.0)
    }
}

struct RentBox: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("배달렌트")
                    .font(.system(size: 18, weight: .bold))
                Image("detailIcon")
            }

            HStack {
                
                VStack {
                    Text("신청")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Color.white)
                }
                .frame(width: 175.0, height: 40.0)
                .background(Color("PrimaryColor"))
                .cornerRadius(10, corners: .bottomLeft)
                .cornerRadius(10, corners: .topLeft)
                .padding(.trailing, -4)
                
                VStack {
                    Text("미신청")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Color.black)
                }
                .frame(width: 175.0, height: 40.0)
                .background(Color.white)
                .cornerRadius(10, corners: .bottomRight)
                .cornerRadius(10, corners: .topRight)
                .padding(.leading, -4)
                .shadow(color: Color(hue: 0.0, saturation: 0.014, brightness: 0.864), radius: 10, x: 0, y: 0)

            }
            .frame(maxWidth: 350.0)
        }
        .padding(.top, 450.0)
        .padding(.horizontal, 20.0)
    }
}

struct CarDetailBox: View {
    var body: some View {
        VStack {
            VStack {
                Image("kiaCarDetail_Icon")

                HStack {
                    VStack(alignment: .leading) {
                        Image("kiaIcon")
                            .resizable()
                            .frame(width: 50.0, height: 11.77)

                        Text("2021 K8 하이브리드")
                            .font(.system(size: 17, weight: .medium))
                            .padding(.top, 5.0)
                    }

                    Spacer()
                }
                .padding(.bottom, 20.0)

                HStack {
                    HStack {
                        Text("연료")
                            .font(.system(size: 13, weight: .bold))

                        Spacer()
                        Text("휘발유+전기")
                            .font(.system(size: 13, weight: .light))
                    }

                    HStack {}
                        .padding(.horizontal, 10.0)

                    HStack {
                        Text("색상")
                            .font(.system(size: 13, weight: .bold))
                        Spacer()
                        Text("스노우 화이트 펄")
                            .font(.system(size: 13, weight: .light))
                    }
                }
                .padding(.bottom, 10.0)

                HStack {
                    HStack {
                        Text("주행거리")
                            .font(.system(size: 13, weight: .bold))

                        Spacer()
                        Text("22,180km")
                            .font(.system(size: 13, weight: .light))
                    }

                    HStack {}
                        .padding(.horizontal, 10.0)

                    HStack {
                        Text("등록일")
                            .font(.system(size: 13, weight: .bold))
                        Spacer()
                        Text("2021/09/08")
                            .font(.system(size: 13, weight: .light))
                    }
                }
                .padding(.bottom, 10.0)

                HStack {
                    HStack {
                        Text("렌트제한")
                            .font(.system(size: 13, weight: .bold))

                        Spacer()
                        Text("26세/면허3년")
                            .font(.system(size: 13, weight: .light))
                    }

                    HStack {}
                        .padding(.horizontal, 10.0)

                    HStack {
                        Text("렌트상태")
                            .font(.system(size: 13, weight: .bold))
                        Spacer()
                        Text("예약가능")
                            .font(.system(size: 13, weight: .light))
                    }
                }
            }
            .padding(.horizontal, 30.0)
            .padding(.bottom, 20.0)

            VStack {
                HStack(alignment: .center) {
                    VStack {
                        Text("2021년 9월 13일")
                            .foregroundColor(Color.white)
                            .font(.system(size: 12, weight: .bold))
                        Text("오전 11:00")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .bold))
                    }

                    Spacer()
                    Text("~")
                        .foregroundColor(Color.white)
                        .font(.system(size: 16, weight: .bold))
                    Spacer()
                    VStack {
                        Text("2021년 9월 13일")
                            .foregroundColor(Color.white)
                            .font(.system(size: 12, weight: .bold))
                        Text("오전 11:00")
                            .foregroundColor(Color.white)
                            .font(.system(size: 16, weight: .bold))
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 50.0)
            .padding(.vertical, 20.0)
            .frame(width: 350.0)
            .background(Color("PrimaryColor"))
        }
        .frame(width: 350.0, height: 402.0)
        .background(Color.white)
        .cornerRadius(10, corners: .bottomLeft)
        .cornerRadius(10, corners: .bottomRight)
        .cornerRadius(10, corners: .topLeft)
        .cornerRadius(10, corners: .topRight)
        .shadow(color: Color(hue: 0.0, saturation: 0.007, brightness: 0.769), radius: 10, x: 0, y: 0)
        .offset(x: 0, y: -200)
    }
}

struct TopMenuCarDetail: View {
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
                    Text("렌트 계약")
                        .foregroundColor(Color.white)
                        .font(.system(size: 19, weight: .bold))
                    Spacer()
                    Image("reservationIcon")
                }
                .padding(.top, 20.0)
                .padding(.horizontal, 30.0)
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

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 6s"))
            .previewDisplayName("iPhone 6s")

        CarDetailView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
    }
}
