//
//  AppSetting.swift
//  DOOS
//
//  Created by jie.huang on 24/12/2019.
//  Copyright © 2019 DOOS. All rights reserved.
//

import UIKit


func clearData() {
    
    UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.token.rawValue)
}


enum UserDefaultsKeys : String {

    case token
}

extension UserDefaults{
    

    func setToken(value : String) {
        set(value, forKey: UserDefaultsKeys.token.rawValue)
    }
    func getToken() ->String{
        return string(forKey: UserDefaultsKeys.token.rawValue) ?? ""
    }
}


//@objc class AppSetting: NSObject{
//
//
//    var SettingInfo:AppSettingModel? = nil
//
//
//    static let sex = "dict_sex"
//    static let exp = "doos_experience"
//    static let pic = ""
//
//    @objc static let share = AppSetting()
//
//    override init()
//    {
//         SettingInfo = AppSettingModel()
//    }
//
//}




