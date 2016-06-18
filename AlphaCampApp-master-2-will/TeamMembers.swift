//
//  TeamMember.swift
//  AlphaCampApp
//
//  Created by 建達 陳 on 2016/4/1.
//  Copyright © 2016年 Alpha Camp. All rights reserved.
//

import Foundation

class TeamMembers {
    var optionalArray:[Person] = [Person]()
    
    let person1:Person = Person(name: "Bernard Chan", image: "Bernard Chan", info: "TMI 駐場創業家，曾任 Yahoo！亞太區廣告業務總監。出生香港、麻省理工學院 Sloan 商學院 MBA 畢業，芝加哥 Ruby on Rails 課程研習、在美國，北京，香港有多次 Startup 經驗。")
    let person2:Person = Person(name: "Tim Du", image: "Tim Du", info: "清大物理系唸完換台大國企所，熱愛棒球，喜歡喝咖啡、看星星、挑戰新事物，就算買不起 Google Glass 也要想辦法跟別人借來玩一玩。喜歡的一句話是：「人生就像騎腳踏車，為了保持平衡，必須不斷前進。」")
    let person3:Person = Person(name: "Ariel Chen", image: "Ariel Chen", info: "政大哲學系、中正心理所畢業。在中國大陸闖蕩三年。認為教育就是從人出發的一種用心交流，希望回歸教育，凝聚最真摯的正向能量，協助講師找到最可發揮的舞台，培育學員找到新的方向。")
    let person4:Person = Person(name: "Evelyn Chang", image: "Evelyn Chang", info: "卡內基美隆大學藝術管理碩士，從戲劇、藝術管理到數位行銷，不變的是對這個世界的好奇心與對生活的熱情。熱愛行銷與學習，持續關注創業、社群與網路發展。努力讓更多人知道 ALPHA Camp 的好，希望這世界因為自己的存在而美好一點點。")
    let person5:Person = Person(name: "iHower Chang", image: "iHower Chang", info: "Ruby on Rails 實戰聖經作者，前 Faria Systems CTO，多次 COSCUP、OSDC.TW、台灣與中國RubyConf、日本 RubyKaigi 大會講者。")
    let person6:Person = Person(name: "Benson Sun", image: "Benson Sun", info: "政大財政系，在 Startup 圈闖蕩的小朋友，從大四開始自學 Web Development ，是 Rails 的初學者 ，立志成為行銷和技術兼備的人才，目前在 ALPHA Camp 愉快的玩耍中。")
    let person7:Person = Person(name: "Shyne Tseng", image: "Shyne Tseng", info: "GetProperly 共同創辦人，台大資管MBA，史丹佛大學電腦科學碩士，旅居矽谷，愛好旅行、美食和科技。")
    let person8:Person = Person(name: "Brian Fang", image: "Brian Fang", info: "FUNTEK軟體架構師，5945呼叫師傅共同創辦人，前CyberLink資深工程師。作品Picaca獲選為Apple featured app (2013/08)，暢銷書《iPhone SDK 3 Programming 應用程式開發》作者。")
    let person9:Person = Person(name: "Peter Pan", image: "Peter Pan", info: "暢銷書 App 程式設計入門 - iPhone. iPad作者，MacToday App 開發專欄作家，FUNTEK 首席 iOS App 工程師，點點數位 iOS App 顧問，PChome Mac 基礎教室專欄作家，開發 Wealthy、LOCOMO 運動記錄等知名App。")
    let person10:Person = Person(name: "Edward Chiang", image: "Edward Chiang", info: "App 開發顧問. 日傑資訊負責人，前愛料理 App 開發隊長，寫過 LovingHeart for iOS, for Android, 愛料理 for iPhone, 愛料理 for iPad, Mr. Plurk for iOS 等知名五星等級 App。")
    let person11:Person = Person(name: "Amos Lee", image: "Amos Lee", info: "天橋科技視覺設計總監，資策會講師，資深前端設計師，致力於CSS技術研究與教學。")
    let person12:Person = Person(name: "Abby Hsu", image: "Abby Hsu", info: "渴望突破體制內教育的大三生，在自我探索的過程中夾雜著迷惘與孤單，靠著網路的學習資源、媒體、各式專業書籍，逐漸理出自己的未來規劃，因此決定報名 Bootcamp，希望能藉由課程接觸網路新創的世界，培養數位行銷的專業能力，朝自己的夢想邁進。")
    let person13:Person = Person(name: "龔建嘉", image: "龔建嘉", info: "台大獸醫研究所畢業，從台北到南部從事大動物獸醫師的工作，在全台灣各個牧場出診照顧乳牛，但是在傳統的行業當中卻期待能夠擁有新創的思維，開啟一條不一樣的路。來到 ALPHA Camp 學習一顆靈活的行銷頭腦，期待成為改變產業的橋樑。")
    let person14:Person = Person(name: "Anthony Liu", image: "Anthony Liu", info: "伊利諾大學香檳分校物理系，退伍後放棄到美國念研究所的機會，專心投注於自己開發的通訊輔助 app，希望透過 ALPHA Camp 認識更多有志創業的夥伴，激盪彼此想法，並學習數位行銷為未來的創業之路做準備。")
    let person15:Person = Person(name: "Winnie Huang", image: "Winnie Huang", info: "交大經營管理所，在學時期即積極於外商實習與參加行銷競賽，並於德國交換學生一年，不斷找尋人生方向。上份工作為政府智庫任職研究員，工作一陣子後發現自己仍對行銷情有獨鍾，毅然決定轉換跑道，報名 Bootcamp 培養數位行銷實戰能力。自 ALPHA Camp 畢業後，現已加入進駐 Appworks 的創業團隊擔任行銷專員。")
    let person16:Person = Person(name: "Eddie Tsa", image: "Eddie Tsa", info: "25歲畢業於澳洲昆士蘭大學微波通信工程博士，現任職廣達擔任技術專案經理，有十年的無線網通與消費性電子硬體經驗，因親身感參與並深深受到麻省理工學院「One Laptop per Child」計畫的啟發，決心朝向物聯網產業邁進，並做出更實用的產品來幫助第三世界弱勢國家得到更好的生活品質。希望在 ALPHA Camp 學習數位行銷知識，以逐漸落實這個人生志業。")
    let person17:Person = Person(name: "Reinhardt Lin", image: "Reinhardt Lin", info: "工程師和 PM 背景。德國 ESMT 商學院與北京大學光華管理學院 MBA。資深宅男、無國界浪人、社會企業中毒者。因為不小心在創業競賽中獲得佳績，誤打誤撞地走上創業的不歸路。希望藉由在 ALPHA Camp 所習得的 Web 網站開發技能，親手打造產品。有朝一日，實現「魯蛇逆襲」的夢想。")
    let person18:Person = Person(name: "David Wang", image: "David Wang", info: "台大會計系，原本在知名新創公司擔任產品規劃經理，隨著工作經驗增長，深刻體認到持續進修的重要性，在與公司主管充分溝通後，選擇離職來到 ALPHA Camp 學習 iOS Development，經過10週的學習，現已成功轉職成為新創公司的 app 工程師。")
    let person19:Person = Person(name: "Amos Chen", image: "Amos Chen", info: "台大心理系，熱愛戲劇表演與幕後硬體技術，工作之餘與朋友共組戲團表演，曾演出於台北藝穗節。看好網路產業前景，對全端開發有濃厚興趣，希望在 ALPHA Camp 累積前後端開發的能力，轉型成為網站系統工程師。")
    
    func getCoreMembersArray() -> [Person]{
        optionalArray.append(person1)
        optionalArray.append(person2)
        optionalArray.append(person3)
        optionalArray.append(person4)
        optionalArray.append(person5)
        optionalArray.append(person6)

        return optionalArray
    }
    
    func getTeachersArray() -> [Person]{
        optionalArray.append(person5)
        optionalArray.append(person7)
        optionalArray.append(person8)
        optionalArray.append(person9)
        optionalArray.append(person10)
        optionalArray.append(person11)
        
        return optionalArray
    }
    func getACGuys() -> [Person]{
        optionalArray.append(person12)
        optionalArray.append(person13)
        optionalArray.append(person14)
        optionalArray.append(person15)
        optionalArray.append(person16)
        optionalArray.append(person17)
        optionalArray.append(person18)
        optionalArray.append(person19)
        
        return optionalArray
    }
    
}