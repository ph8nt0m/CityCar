//
//  ContentView.swift
//  CityCar
//
//  Created by 이동준 on 2022/04/13.
//

import CoreData
import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigatorView()
            
            .navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NavigatorView: View {
    @State var isLoading: Bool = true

    init() {
        UIScrollView.appearance().bounces = false
    }

    var body: some View {
        ZStack {
            // Launch Screen
//                if isLoading {
//                    launchScreenView
//                }
            VStack {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        VStack {
                            TopMenu()
                        }

                        ToogleTabList()
                    }

                    GPSBox()

                    VStack {
                        CarListView()
                        CarListView()
                        CarListView()
                    }
                    .padding(.bottom, 10.0)
                }
                NavigationLink(destination: CarView().navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true).navigationBarTitle("", displayMode: .automatic)) {
                        BottomBar()
                    }
            }

        }.ignoresSafeArea(edges: .vertical)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading.toggle()
                }
            }
    }
}

struct TopMenu: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image("menu")
                    Spacer()
                    Image("textLogo")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 70.0, height: 20.0)
                    Spacer()
                    Image("alarm")
                }
                .padding(.top, 20.0)
                .padding(.horizontal, 30.0)

                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("안녕하세요,")
                                .foregroundColor(Color.white)
                            Text("홍길동")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Text("님!")
                                .foregroundColor(Color.white)
                        }
                        .padding(.bottom, 1.0)

                        Text("렌트 유형을 선택해주세요")
                            .foregroundColor(Color.white)
                    }

                    Spacer()
                    Image("car")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 36.0, height: 48.0)
                }
                .padding(.horizontal, 30.0)
                .padding(.top, 50.0)
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

struct ToogleTabList: View {
    @State var isToggleTab = 0

    var body: some View {
        HStack {
            Button(action: {
                isToggleTab = 0
            }) {
                VStack {
                    Image("calendar_1")

                    Text("하루만 탈게요")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Color.black)
                        .padding(.top, 15.0)
                        .padding(.bottom, 5.0)

                    Text("데일리\n단기렌트")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .lineSpacing(5.0)
                }
                .frame(width: 110.0, height: 165.0)
                .background(Color.white)
                .cornerRadius(10, corners: .bottomLeft)
                .cornerRadius(10, corners: .bottomRight)
                .cornerRadius(10, corners: .topLeft)
                .cornerRadius(10, corners: .topRight)
                .shadow(color: Color(hue: 0.651, saturation: 0.44, brightness: 0.989), radius: isToggleTab == 0 ? 10 : 0, x: 0, y: 0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("PrimaryColor"), lineWidth: isToggleTab == 0 ? 1 : 0)
                )
            }

            Button(action: {
                isToggleTab = 1
            }) {
                VStack {
                    Image("calendar_31")

                    Text("한달간 탈게요")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Color.black)
                        .padding(.top, 15.0)
                        .padding(.bottom, 5.0)

                    Text("월단위\n기간렌트")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .lineSpacing(5.0)
                }
                .frame(width: 110.0, height: 165.0)
                .background(Color.white)
                .cornerRadius(10, corners: .bottomLeft)
                .cornerRadius(10, corners: .bottomRight)
                .cornerRadius(10, corners: .topLeft)
                .cornerRadius(10, corners: .topRight)
                .shadow(color: Color(hue: 0.651, saturation: 0.44, brightness: 0.989), radius: isToggleTab == 1 ? 10 : 0, x: 0, y: 0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("PrimaryColor"), lineWidth: isToggleTab == 1 ? 1 : 0)
                )
            }

            Button(action: {
                isToggleTab = 2
            }) {
                VStack {
                    Image("infinite")

                    Text("제한없이 탈게요")
                        .font(.system(size: 13, weight: .regular))
                        .foregroundColor(Color.black)
                        .padding(.top, 15.0)
                        .padding(.bottom, 5.0)

                    Text("언리밋\n장기렌트")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .lineSpacing(5.0)
                }
                .frame(width: 110.0, height: 165.0)
                .background(Color.white)
                .cornerRadius(10, corners: .bottomLeft)
                .cornerRadius(10, corners: .bottomRight)
                .cornerRadius(10, corners: .topLeft)
                .cornerRadius(10, corners: .topRight)
                .shadow(color: Color(hue: 0.651, saturation: 0.44, brightness: 0.989), radius: isToggleTab == 2 ? 10 : 0, x: 0, y: 0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("PrimaryColor"), lineWidth: isToggleTab == 2 ? 1 : 0)
                )
            }
        }.offset(x: 0, y: 150)
    }
}

struct GPSBox: View {
    var body: some View {
        HStack {
            Image("gps")

            VStack(alignment: .leading) {
                Text("렌트 받을 지역을 선택해주세요")
                    .font(.system(size: 13, weight: .medium))

                Text("서울특별시 도봉구")
                    .font(.system(size: 18, weight: .bold))
            }
            .padding(.leading, 20.0)
            .padding(.trailing, 40.0)

            Text("변경하기")
                .foregroundColor(Color("PrimaryColor"))
                .font(.system(size: 14, weight: .medium))
        }
        .frame(width: 350.0, height: 90.0)
        .background(Color.white)
        .cornerRadius(10, corners: .bottomLeft)
        .cornerRadius(10, corners: .bottomRight)
        .cornerRadius(10, corners: .topLeft)
        .cornerRadius(10, corners: .topRight)
        .shadow(color:
            Color(hue: 0.0, saturation: 0.023, brightness: 0.814), radius: 10, x: 0, y: 0)
        .padding(.top, 100.0)
    }
}

struct BottomBar: View {
    var body: some View {
        HStack {
            Text("총")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.white)

            Text("22건의")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color.white)

            Text("렌트카를 찾았어요")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.white)
        }
        .frame(
            maxWidth: .infinity
        ).frame(height: 60.0, alignment: .center)
        .background(Color("PrimaryColor"))
        .cornerRadius(10, corners: .topLeft)
        .cornerRadius(10, corners: .topRight)
        .padding(EdgeInsets(top: 0, leading: 0, bottom: safeAreaBottomInset(), trailing: 0))
    }
}

struct CarListView: View {
    var body: some View {
        HStack {
            VStack {
                Text("전체")
                    .font(.system(size: 15, weight: .medium))
                Text("ALL")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(Color(red: 0.49411764705882355, green: 0.49411764705882355, blue: 0.49411764705882355))
            }.frame(width: 110.0, height: 80.0)
                .background(Color.white)
                .cornerRadius(10, corners: .bottomLeft)
                .cornerRadius(10, corners: .bottomRight)
                .cornerRadius(10, corners: .topLeft)
                .cornerRadius(10, corners: .topRight)
                .shadow(color:
                    Color(hue: 0.0, saturation: 0.023, brightness: 0.814), radius: 10, x: 0, y: 0)

            HStack {
                VStack(alignment: .leading) {
                    Text("경형")
                        .font(.system(size: 13, weight: .medium))
                    Text("모닝")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(Color(red: 0.49411764705882355, green: 0.49411764705882355, blue: 0.49411764705882355))
                }
                .padding(.leading, 10.0)

                Image("car_1")

            }.frame(width: 110.0, height: 80.0)
                .background(Color.white)
                .cornerRadius(10, corners: .bottomLeft)
                .cornerRadius(10, corners: .bottomRight)
                .cornerRadius(10, corners: .topLeft)
                .cornerRadius(10, corners: .topRight)
                .shadow(color:
                    Color(hue: 0.0, saturation: 0.023, brightness: 0.814), radius: 10, x: 0, y: 0)

            HStack {
                VStack(alignment: .leading) {
                    Text("준중형")
                        .font(.system(size: 13, weight: .medium))
                        .lineSpacing(50)
                        .fixedSize(horizontal: true, vertical: false)
                    Text("아반떼")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(Color(red: 0.49411764705882355, green: 0.49411764705882355, blue: 0.49411764705882355))
                        .fixedSize(horizontal: true, vertical: false)
                }
                .padding(.leading, 10.0)

                Image("car_1")

            }.frame(width: 110.0, height: 80.0)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 6s"))
            .previewDisplayName("iPhone 12")

        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
    }
}
