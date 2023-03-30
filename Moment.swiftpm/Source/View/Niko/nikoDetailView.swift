//
//  SwiftUIView.swift
//  
//
//  Created by Niko Yejin Kim on 2023/03/28.
//

import SwiftUI

struct nikoDetailView: View {
    @State private var showImage = false
    
    @State private var showDetails1 = false
    @State private var showDetails2 = false
    @State private var showDetails3 = false
    @State private var showDetails4 = false
    @State private var showDetails5 = false
    @State private var showDetails6 = false
    @State private var showDetails7 = false
    
    @State var diarySheet: CGFloat = 0.0
    @State var diaryOpacity: CGFloat = 0.0
    var diarySheetValue: CGFloat = -500
    
    @State var passwordInput = readLine()
    
    var body: some View {
        
        
        
        ZStack{AngularGradient(gradient: Gradient(colors:[.white,.purple]), center: .top)
                .edgesIgnoringSafeArea(.all) //배경색
            
            VStack{
                ZStack{
                    Image("mainCard2")
                        .rotationEffect(.degrees(3), anchor: UnitPoint(x:1, y: 0.5))
                    
                    Text("🌈 우리들의 아지트 웰빙 아울렛")
                        .offset(y:130)
                        .font(.system(size: 13))
                        .foregroundColor(Color(hex: 0x7f6966))
                        .rotationEffect(.degrees(3), anchor: UnitPoint(x:1, y: -8))
                }
                
                //사진 추가 후 위에 텍스트 얹기
                    
                /*   Button {
                 print("Let's go")
                 
                 }
                 label: {
                 Text("What's in my Well-being?   ")
                 .font(.system(size: 25))
                 .fontWeight(.bold)
                 .foregroundColor(Color(hex: 0xffbe3e))
                 .background(Color(hex: 0x000000).opacity(0.8))
                 
                 
                 
                 }*/
                
                /* Button(action: {
                 self.showImage.toggle()
                 }) {
                 Text(" 니코의 비밀일기장")
                 .font(.system(size: 25))
                 .fontWeight(.bold)
                 .foregroundColor(Color(hex: 0xffffff))
                 }
                 .buttonStyle(.borderedProminent)
                 .tint(.red.opacity(0.3))
                 .padding(.bottom,20)// 사진 펼쳐지는 버튼 */
                
                Button {
                    diarySheet = diarySheetValue
                    diaryOpacity = 1.0
                } label: {
                    Text(" 니꼬의 비밀일기장")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: 0xffffff))
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(hex: 0x9940ff).opacity(0.5))
                .offset(y:80)
                .shadow(radius: 4)
                
            }
            .offset(y:-80)
            
            
                ZStack{
                    Rectangle()
                        .frame(width: 500.0, height: 1000.0)
                        .foregroundColor(Color(red: 0.924, green: 0.84, blue: 0.979))
                    Image("diary")
                    Text("암호를 선택하시오.\n\"포항 최고의 패션 성지는?\"")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .offset(y:-60)
                        .multilineTextAlignment(.center)
                    VStack{
                        Spacer()
                            .frame(height: 100.0)
                        Button(action: {
                            self.showImage.toggle()
                        }) {
                            Text("① 웰빙아울렛")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x000000))
                                .background(Color(hex: 0x7080ff).opacity(0.3))
                        }
                        Button(action: {
                            self.showImage.toggle()
                        }) {
                            Text("② 효자동 웰빙아울렛")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x000000))
                                .background(Color(hex: 0x7080ff).opacity(0.3))
                        }
                        Button(action: {
                            self.showImage.toggle()
                        }) {
                            Text("③ 웰빙 거기")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0x000000))
                                .background(Color(hex: 0x7080ff).opacity(0.3))
                        }
                    }
                    .padding(.leading, -30.0)
                    
                    
                }.padding(.top,-130)
                    .offset(x:30, y:-170)
                    .ignoresSafeArea()
                    .offset(x: diarySheet - diarySheetValue )
                    .opacity(diaryOpacity)
                    .animation(.easeInOut(duration: 1.5), value: diarySheet)
                .animation(.linear(duration: 1.5), value: diaryOpacity)
                
                
                if showImage {
                    ZStack{
                        Rectangle()
                            .frame(width: 500.0, height: 1000.0)
                            .foregroundColor(Color(red: 0.924, green: 0.84, blue: 0.979))
                            
                        Image("diary")
                            .padding(.top,-130)
                           .offset(x:30, y:-170)
                        
                        Button {
                            diarySheet = diarySheetValue
                            diaryOpacity = 1.0
                        } label: {
                            Text("🎉 정답! \n아래의 스티커를 눌러보세요.")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color(hex: 0xffffff))
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color(hex: 0x9940ff).opacity(0.5))
                        .shadow(radius: 3)
                        .offset(y:50)
                        
                        
                        /*Text("🎉 정답! \n아래의 스티커를 눌러보세요.")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .offset(y:140)*/
                        
                        ScrollView(.horizontal, showsIndicators: true)
                        {
                            HStack{
                                Text("")
                                    .padding(.leading, 70.0)
                                
                                Button(action: {
                                    self.showDetails1.toggle()
                                }) {
                                    Image("wellbeing")
                                        .renderingMode(.original)
                                }
                                
                                Button(action: {
                                    self.showDetails2.toggle()
                                }) {
                                    Image("statue")
                                        .renderingMode(.original)
                                }
                                
                                Button(action: {
                                    self.showDetails3.toggle()
                                }) {
                                    Image("cafe")
                                        .renderingMode(.original)
                                }
                                
                                Button(action: {
                                    self.showDetails4.toggle()
                                }) {
                                    Image("gate")
                                        .renderingMode(.original)
                                }
                                
                                Button(action: {
                                    self.showDetails5.toggle()
                                }) {
                                    Image("manequin")
                                        .renderingMode(.original)
                                }
                                
                                Button(action: {
                                    self.showDetails6.toggle()
                                }) {
                                    Image("tops")
                                        .renderingMode(.original)
                                }
                                
                                Button(action: {
                                    self.showDetails7.toggle()
                                }) {
                                    Image("sign")
                                        .renderingMode(.original)
                                }
                                Text("")
                                    .padding(.leading, 70.0)
                                
                            }
                            .background(Color(hex: 0x7080ff).opacity(0.1))
                        }
                        .offset(y: 240)
                    }
                }
            
            ZStack{
                if showImage {
                    ZStack{
                        /* Image("diary")
                           /* .padding(.top,-130)
                            .offset(x:30, y:-170)
                            .ignoresSafeArea()*/
                            .opacity(diaryOpacity)
                            .animation(.easeInOut(duration: 2.5), value: diarySheet)
                            .animation(.linear(duration: 2.5), value: diaryOpacity)
                        */
                         Text("날짜: 23년 3월 15일                            날씨: 맑음")
                            .offset(x:20, y:-390)
                            .foregroundColor(Color(hex: 0x7f6966))
                
                        
                    }
                }
                if showDetails1{
                    Text("MC1 PIERCE 팀은 나에게 '웰빙' 그 자체였다")
                        .fontWeight(.semibold)
                        .offset(x:10, y:-352)
                        .foregroundColor(Color(hex: 0x6f6655))
                    
                }
                if showDetails2{
                    Text("아낌없이 나눠주는 우리들의 깃 교수님 케일")
                        .fontWeight(.semibold)
                        .offset(x:20, y:-315)
                        .foregroundColor(Color(hex: 0x7f6966))
                }
                if showDetails3{
                    Text("모두를 숨멎게 만드는 아이디어 뱅크 올리버")
                        .fontWeight(.semibold)
                        .offset(x:20, y:-277)
                        .foregroundColor(Color(hex: 0x7f6966))
                }
                if showDetails4{
                    Text("레퍼런스 부자 미친 디자인 금손의 소유자 끌라우")
                        .fontWeight(.semibold)
                        .offset(x:15, y:-240)
                        .foregroundColor(Color(hex: 0x7f6966))
                }
                if showDetails5{
                    Text("테크인가 도메인인가 디자인인가 우리들의 잡스 기영")
                        .fontWeight(.semibold)
                        .offset(x:13, y:-202)
                        .foregroundColor(Color(hex: 0x7f6966))
                }
                if showDetails6{
                    Text("우리를 칭찬감옥에 가둬버리는 따뜻한 개발천재 퍼피")
                        .fontWeight(.semibold)
                        .offset(x:10, y:-164)
                        .foregroundColor(Color(hex: 0x7f6966))
                }
                if showDetails7{
                    Text("생각하면 마음이 편안해지는 사람들, 이게 웰빙이지!")
                        .fontWeight(.semibold)
                        .offset(x:10, y:-125)
                        .foregroundColor(Color(hex: 0x7f6966))
                  /*  Text("#웰빙아울렛")
                        .fontWeight(.semibold)
                        .offset(x:140, y:-82)
                        .foregroundColor(Color(hex: 0x9940ff)) */
                }

                }
            .padding(.top,78)
            }
        }
    }

        
    
    struct nikoDetailView_Previews: PreviewProvider {
        static var previews: some View {
            nikoDetailView()
        }
    }

