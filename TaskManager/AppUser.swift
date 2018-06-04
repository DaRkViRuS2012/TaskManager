//
//  User.swift
//  Wardah
//
//  Created by Dania on 6/12/17.
//  Copyright © 2017 BrainSocket. All rights reserved.
//

import SwiftyJSON

// MARK: Gender types
enum GenderType: String {
    case male = "male"
    case female = "female"
}

// MARK: User account type
enum AccountType: String {
    case normal = "normal"
    case celebrity = "celebrity"
}

// MARK: User login type
enum LoginType: String {
    case rombeye = "rombeye"
    case facebook = "facebook"
    case twitter = "twitter"
    case instagram = "instagram"
    /// check current login state (Social - Normal)
    var isSocial:Bool {
        switch self {
        case .rombeye:
            return false
        default:
            return true
        }
    }
}

class AppUser: BaseModel {
    // MARK: Keys
    private let kUserFirstNameKey = "first_name"
    private let kUserLastNameKey = "last_name"
    private let kUserEmailKey = "email"
    private let kUserProfilePicKey = "profile_photo"
    private let kUserBirthdayKey = "birth_date"
    private let kUserGenderKey = "gender"
    private let kUserCountryKey = "country"
    private let kUserFollowingCountKey = "followingCount"
    private let kUserFollowersCountKey = "followersCount"
    private let kUserCategoriesKey = "categories"
    private let kUserLoginTypeKey = "loginType"
    private let kUserAccountTypeKey = "type"
    private let kUserIsVerifiedKey = "isVerified"
    private let kUserTokenKey = "token"
    private let kUserPreferencesKey = "preferences"
    private let kUserIdKey = "id"
    private let KHongKongIDKey = "hk_id"
    private let KPoneKey = "phone_number"
    // MARK: Properties
    public var firstName: String?
    public var lastName: String?
    public var email: String?
    public var profilePic: String?
    public var birthday: Date?
    public var gender: GenderType?
    public var country: String?
    public var isVerified: Bool?
    public var token: String?
    public var mobile:String?
    public var address:String?
    public var city:String?
    public var state:String?
    public var hongKong:String?
    public var UId:String?
    
    
    // user full name
    public var fullName: String {
        if let fName = firstName, !fName.isEmpty {
            if let lName = lastName, !lName.isEmpty {
                return  fName + " " + lName
            }
            return fName
        }
        return lastName ?? ""
    }
    
    // MARK: User initializer
    public override init(){
        super.init()
    }
    
    public required init(json: JSON) {
        super.init(json: json)
        if let value = json[kUserIdKey].string{
            UId = value
        }else if let value = json[kUserIdKey].int{
            UId  = "\(value)"
        }
        firstName = json[kUserFirstNameKey].string
        lastName = json[kUserLastNameKey].string
        email = json[kUserEmailKey].string
        profilePic = json[kUserProfilePicKey].string
        if let dateString = json[kUserBirthdayKey].string {
            birthday = DateHelper.getDateFromISOString(dateString)
        }
        if let genderString = json[kUserGenderKey].string {
            gender = GenderType(rawValue: genderString)
        }
        country = json[kUserCountryKey].string
        isVerified = json[kUserIsVerifiedKey].boolValue
        token = json[kUserTokenKey].string
        mobile = json[KPoneKey].string

    }
    
    public override func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = super.dictionaryRepresentation()
        if let value = UId{
            dictionary[kUserIdKey] = value
        }
        // first name
        if let value = firstName {
            dictionary[kUserFirstNameKey] = value
        }
        // last name
        if let value = lastName {
            dictionary[kUserLastNameKey] = value
        }
        // email
        if let value = email {
            dictionary[kUserEmailKey] = value
        }
        // profile picture
        if let value = profilePic {
            dictionary[kUserProfilePicKey] = value
        }
        // birthday
        if let value = birthday {
            dictionary[kUserBirthdayKey] = DateHelper.getISOStringFromDate(value)
        }
        // gender
        if let value = gender?.rawValue {
            dictionary[kUserGenderKey] = value
        }
        // country
        if let value = country {
            let url:[String:AnyObject] = ["url":value as AnyObject]
            let v:[String:AnyObject] = ["data":url as AnyObject]
            dictionary[kUserCountryKey] = v
        }
        // following count
        if let value = hongKong {
            dictionary[KHongKongIDKey] = value
        }
       
        // is verified
        if let value = isVerified {
            dictionary[kUserIsVerifiedKey] = value
        }
        // token
        if let value = token {
            dictionary[kUserTokenKey] = value
        }
        
        if let value = mobile {
            dictionary[KPoneKey] = value
        }
       
        return dictionary
    }
    
}
