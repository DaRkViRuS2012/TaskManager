//
//  AbstractController.swift
//  Wardah
//
//  Created by Hani on 19/10/16.
//  Copyright © 2016 BrainSocket. All rights reserved.
//

import UIKit
import Toast_Swift

// MARK: Alert message types
enum MessageType{
    case success
    case error
    case warning
    
    var toastIcon: String {
        switch self {
        case .success:
            return "successIcon"
        case .error:
            return "errorIcon"
        case .warning:
            return "warningIcon"
        }
    }
    
    var toastTitle: String {
        switch self {
        case .success:
            return "GLOBAL_SUCCESS_TITLE"
        case .error:
            return "GLOBAL_ERROR_TITLE"
        case .warning:
            return "GLOBAL_WARNING_TITLE"
        }
    }
}

enum titleImageView: String{
    case logoAndText = "navHome"
    case logoIcon = "nav"
    case filter = "navFilter"
    case sigin = "navSignin"
    case signup = "navSignup"
}

class AbstractController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    var searchView: UIView = UIView.init()
    /// Instaniate view controller from main story board
    ///
    /// **Warning:** Make sure to set storyboard id the same as the controller name
    class func control() -> AbstractController {
        return UIStoryboard(name: "Start", bundle: nil).instantiateViewController(withIdentifier: String(describing: self)) as! AbstractController
    }
    
    public static var className:String {
        return String(describing: self.self)
    }
    
    // MARK: Navigation Bar
    func setNavBarTitle(title : String) {
        
        self.navigationItem.titleView = nil
        self.navigationItem.title = title
    }
    
    func setCustomeNavBarTitle(type : navTitleViewTypes) {
        let navView = navTitleView()
        navView.fillWith(type: type)
        navView.backgroundColor = AppColors.lightPink
        self.navigationItem.titleView = nil
        self.navigationItem.titleView = navView
    }
    
    func setNavBarTitleImage(type:titleImageView) {
        // add app logo to navigation title
        let image = UIImage(named: type.rawValue)
        let imageView = UIImageView(image:image)
        self.navigationItem.titleView = imageView
        
    }
    
    
    
    
    
    
    /// Navigation bar custome back button
    var navBackButton : UIBarButtonItem  {
        let _navBackButton   = UIButton()
        _navBackButton.setBackgroundImage(UIImage(named: "navBackIcon"), for: .normal)
        _navBackButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        _navBackButton.addTarget(self, action: #selector(backButtonAction(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: _navBackButton)
    }
    
    /// Navigation bar custome close button
    var navCloseButton : UIBarButtonItem {
        let _navCloseButton = UIButton()
        _navCloseButton.setBackgroundImage(UIImage(named: "navClose"), for: .normal)
        _navCloseButton.frame = CGRect(x: 0, y: 0, width: 17, height: 17)
        _navCloseButton.addTarget(self, action: #selector(closeButtonAction(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: _navCloseButton)
    }
    
    
    var navRightCloseButton : UIBarButtonItem {
        let _navCloseButton = UIButton()
        _navCloseButton.setBackgroundImage(UIImage(named: "navClose"), for: .normal)
        _navCloseButton.frame = CGRect(x: 0, y: 0, width: 17, height: 17)
        _navCloseButton.addTarget(self, action: #selector(closeRightButtonAction(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: _navCloseButton)
    }
    
    var navClearButton : UIBarButtonItem {
        let _navCloseButton = UIButton()
        _navCloseButton.setBackgroundImage(UIImage(named: "clear_cart"), for: .normal)
        _navCloseButton.tintColor = .gray
        _navCloseButton.frame = CGRect(x: 0, y: 0, width: 17, height: 17)
        _navCloseButton.addTarget(self, action: #selector(clearButtonAction(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: _navCloseButton)
    }
    
    var navOnGoingOrderButton : UIBarButtonItem {
        let _navCloseButton = UIButton()
        _navCloseButton.setBackgroundImage(UIImage(named: "partner"), for: .normal)
        _navCloseButton.tintColor = .gray
        _navCloseButton.frame = CGRect(x: 0, y: 0, width: 17, height: 17)
        _navCloseButton.addTarget(self, action: #selector(onGoingOrderButtonAction(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: _navCloseButton)
    }
    
    
    
    
    /// Navigation bar Search button
    var navSearchButton : UIBarButtonItem {
        let _navSearchButton = UIButton()
        _navSearchButton.setBackgroundImage(UIImage(named: "navSearch"), for: .normal)
        _navSearchButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        _navSearchButton.addTarget(self, action: #selector(searchButtonAction(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: _navSearchButton)
    }
    
    
    
    
    
    /// Navigation bar logout button
    var navLogoutButton : UIBarButtonItem {
        let _navChatButton = UIButton()
        _navChatButton.setBackgroundImage(UIImage(named: "logout"), for: .normal)
        _navChatButton.frame = CGRect(x: 0, y: 0, width: 33, height: 26)
        _navChatButton.addTarget(self, action: #selector(logoutButtonAction(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: _navChatButton)
    }
    
    
    /// Navigation bar logout button
    var navSettingsButton : UIBarButtonItem {
        let _navChatButton = UIButton()
        _navChatButton.setBackgroundImage(UIImage(named: "setting"), for: .normal)
        _navChatButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        _navChatButton.addTarget(self, action: #selector(settingButtonAction(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: _navChatButton)
    }
    
    
    
    
    /// Navigation bar Favorite button
    var navFavoriteButton : UIBarButtonItem {
        let _navChatButton = UIButton()
        
        _navChatButton.setBackgroundImage(UIImage(named: "heart"), for: .normal)
        _navChatButton.setBackgroundImage(UIImage(named: "heart_filled"), for: .selected)
        _navChatButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        _navChatButton.addTarget(self, action: #selector(favoriteButtonAction(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: _navChatButton)
    }
    
    
    var navFilledFavoriteButton : UIBarButtonItem {
        let _navChatButton = UIButton()
        _navChatButton.setBackgroundImage(UIImage(named: "heart_filled"), for: .normal)
        _navChatButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        _navChatButton.addTarget(self, action: #selector(favoriteButtonAction(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: _navChatButton)
    }
    
    /// Navigation bar logout button
    var navInfoButton : UIBarButtonItem {
        let _navChatButton = UIButton()
        _navChatButton.setBackgroundImage(UIImage(named: "info"), for: .normal)
        _navChatButton.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        _navChatButton.addTarget(self, action: #selector(infoButtonAction(_:)), for: .touchUpInside)
        return UIBarButtonItem(customView: _navChatButton)
    }
    
    
    var testView:UIView{
        let v = UIView()
        v.backgroundColor = .red
        
        return v
        
    }
    
    
    var backGroundImage:UIImageView {
        
        let iv = UIImageView(image: #imageLiteral(resourceName: "bg"))
        iv.contentMode = .scaleAspectFit
        return iv
    }
    
    
    
    
    
    /// Enable back button on left side of navigation bar
    var showNavBackButton: Bool = false {
        didSet {
            if (showNavBackButton) {
                self.navigationItem.leftBarButtonItem = navBackButton
            } else {
                self.navigationItem.leftBarButtonItem = nil
                self.navigationItem.leftBarButtonItems = nil
            }
        }
    }
    
    
    /// Enable info button on left side of navigation bar
    var showNavInfoButton: Bool = false {
        didSet {
            if (showNavInfoButton) {
                self.navigationItem.leftBarButtonItem = navInfoButton
            } else {
                self.navigationItem.leftBarButtonItem = nil
                self.navigationItem.leftBarButtonItems = nil
            }
        }
    }
    
    
    
    
    
    
    
    /// Enable Search button on left side of navigation bar
    var showNavSearchButton: Bool = false {
        didSet {
            if (showNavSearchButton) {
                self.navigationItem.rightBarButtonItem = navSearchButton
            } else {
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
            }
        }
    }
    
    
    /// Enable Favorite button on right side of navigation bar
    var showNavFavoriteButton: Bool = false {
        didSet {
            if (showNavFavoriteButton) {
                self.navigationItem.rightBarButtonItem = navFavoriteButton
            } else {
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
            }
        }
    }
    
    var showNavFilledFavoriteButton: Bool = false {
        didSet {
            if (showNavFilledFavoriteButton) {
                self.navigationItem.rightBarButtonItem = navFilledFavoriteButton
            } else {
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
            }
        }
    }
    
    /// Enable setting button on left side of navigation bar
    var showNavSettingButton: Bool = false {
        didSet {
            if (showNavSettingButton) {
                self.navigationItem.rightBarButtonItem = navSettingsButton
            } else {
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
            }
        }
    }
    
    /// Enable logout button on right side of navigation bar
    var showNavLogoutButton: Bool = false {
        didSet {
            if (showNavLogoutButton) {
                self.navigationItem.rightBarButtonItem = navLogoutButton
            } else {
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
            }
        }
    }
    
    
    
    /// Enable close button on left side of navigation bar
    var showNavCloseButton: Bool = false {
        didSet {
            if (showNavCloseButton) {
                self.navigationItem.leftBarButtonItem = navCloseButton
            } else {
                self.navigationItem.leftBarButtonItem = nil
                self.navigationItem.leftBarButtonItems = nil
            }
        }
    }
    
    
    var showNavRightCloseButton: Bool = false {
        didSet {
            if (showNavRightCloseButton) {
                self.navigationItem.rightBarButtonItem = navRightCloseButton
            } else {
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
            }
        }
    }
    
    
    var showNavClearButton: Bool = false {
        didSet {
            if (showNavClearButton) {
                self.navigationItem.rightBarButtonItem = navClearButton
            } else {
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
            }
        }
    }
    
    var showNavOnGoingOrderButton: Bool = false {
        didSet {
            if (showNavOnGoingOrderButton) {
                self.navigationItem.rightBarButtonItem = navOnGoingOrderButton
            } else {
                self.navigationItem.rightBarButtonItem = nil
                self.navigationItem.rightBarButtonItems = nil
            }
        }
    }
    
    
    /// Enable close button on right side of navigation bar
    var showRightNavCloseButton: Bool = false {
        didSet {
            if (showRightNavCloseButton) {
                self.navigationItem.rightBarButtonItem = navCloseButton
            } else {
                self.navigationItem.leftBarButtonItem = nil
                self.navigationItem.leftBarButtonItems = nil
            }
        }
    }
    
    
    
    
    
    
    
    
    
    // MARK: Status Bar
    func setStatuesBarDark() {
        UIApplication.shared.statusBarStyle = .default
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add background
        
        setStatuesBarDark()
        
        // enable swipe left back guesture
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        // hide keyboard when tapping on non input control
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
        // hide default back button
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = nil
        // add navigation title logo
        // self.setNavBarTitleImage(type: .logoAndText)
        // customize view
        setNavBarHeight()
        self.customizeView()
    }
    
    
    func setNavBarHeight(){
        
        
        //        if let frame = self.navigationController?.navigationBar.frame{
        //            var x = frame
        //            x.size.height = 64
        //            self.navigationController?.navigationBar.frame = x
        //            self.navigationController?.navigationBar.frame.size = (self.navigationController?.navigationBar.sizeThatFits(x.size))!
        //
        //        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // build up view
        setNavBarHeight()
        self.buildUp()
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNavBarHeight()
    }
    // Customize all view members (fonts - style - text)
    func customizeView() {
        
    }
    
    // Build up view elements
    func buildUp() {
    }
    
    @objc func backButtonAction(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @objc func closeButtonAction(_ sender: AnyObject) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func searchButtonAction(_ sender:AnyObject){
        showSearchHeader(animated: true)
    }
    
    
    
    
    @objc func logoutButtonAction(_ sender:AnyObject){
        
        
    }
    
    @objc func settingButtonAction(_ sender:AnyObject){
        
    }
    
    
    @objc func favoriteButtonAction(_ sender:AnyObject){
        
    }
    
    @objc func infoButtonAction(_ sender:AnyObject){
        self.showMessage(message: "", type: .success)
        
    }
    
    
    @objc func closeRightButtonAction(_ sender:AnyObject){
        
        
    }
    
    
    @objc func clearButtonAction(_ sender:AnyObject){
        
    }
    
    
    @objc func onGoingOrderButtonAction(_ sender:AnyObject){
        
        
    }
    
    // MARK: Show toast message
    /// Show toast message with key and type
    func showMessage(message: String, type: MessageType) {
        // toast view measurments
        let toastOffset = CGFloat(48)
        let toastHeight = CGFloat(104)
        let imageOffset = CGFloat(16)
        let imageHeight = CGFloat(32)
        // toast view frames
        let toastFrame = CGRect.init(x: toastOffset, y: (self.view.frame.size.height - toastHeight) / 2, width:self.view.frame.size.width - 2 * toastOffset, height:toastHeight)
        let imageFrame = CGRect.init(x: (toastFrame.size.width - imageHeight) / 2, y: imageOffset, width: imageHeight, height: imageHeight)
        let labelFrame = CGRect.init(x: imageOffset, y: imageHeight + imageOffset, width: toastFrame.size.width - 2 * imageOffset, height: toastHeight - imageOffset - imageHeight)
        // toast view
        let toastView = UIView.init(frame: toastFrame)
        toastView.backgroundColor = UIColor.init(white: 0.35, alpha: 1.0)
        toastView.cornerRadius = 8.0
        // toast image
        let toastImage = UIImageView.init(frame: imageFrame)
        toastImage.image = UIImage(named: type.toastIcon)
        toastView.addSubview(toastImage)
        // toast label
        let toastLabel = UILabel.init(frame: labelFrame)
        toastLabel.text = message.localized
        toastLabel.textAlignment = .center
        toastLabel.font = AppFonts.smallBold
        toastLabel.textColor = UIColor.white
        toastLabel.numberOfLines = 2
        toastView.addSubview(toastLabel)
        // present the toast with custom view
        self.view.showToast(toastView, duration: 2.0, position: .center, completion: nil)
    }
    
    func showAlertMessage(message: String,title:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok".localized, style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    /// Show/Hide activity loader
    func showActivityLoader(_ show: Bool) {
        if (show) {
            // create a new style
            var style = ToastStyle()
            style.backgroundColor = UIColor.init(white: 0.35, alpha: 0.8)
            style.activitySize = CGSize.init(width: 80, height: 80)
            ToastManager.shared.style = style
            // present the toast with the new style
            self.view.makeToastActivity(.center)
            // disable user interaction
            self.view.isUserInteractionEnabled = false
        } else {
            // hide activity loader
            self.view.hideToastActivity()
            // enable user interaction
            self.view.isUserInteractionEnabled = true
        }
    }
    
    // MARK: Keyboard Hide Button
    func addDoneToolBarToKeyboard(textView:UITextView) {
        let doneToolbar : UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        let flexibelSpaceItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let hideKeyboardButton   = UIButton()
        hideKeyboardButton.setBackgroundImage(UIImage(named: "downArrow"), for: .normal)
        hideKeyboardButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        hideKeyboardButton.addTarget(self, action: #selector(dismissKeyboard), for: .touchUpInside)
        let hideKeyboardItem  = UIBarButtonItem(customView: hideKeyboardButton)
        
        doneToolbar.items = [flexibelSpaceItem, hideKeyboardItem]
        doneToolbar.tintColor = UIColor.darkGray
        doneToolbar.sizeToFit()
        textView.inputAccessoryView = doneToolbar
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    // MARK: Search header
    func showSearchHeader(animated: Bool) {
        // offset values
        let statusBarHeight = CGFloat(20)
        let offsetX = CGFloat(16)
        let offsetBottom = CGFloat(8)
        let offsetTop = CGFloat(2)
        // remove previous search view
        searchView.removeFromSuperview()
        // create search view
        searchView = UIView.init(frame: CGRect.init(x: 0, y: -(self.navigationController!.navigationBar.frame.size.height + statusBarHeight), width: self.view.frame.width, height: self.navigationController!.navigationBar.frame.size.height + statusBarHeight))
        searchView.backgroundColor = AppColors.grayXLight
        // add search field
        let searchField = UITextField.init(frame: CGRect.init(x: offsetX, y: offsetTop + statusBarHeight, width: searchView.frame.size.width - 2 * offsetX, height: searchView.frame.size.height - offsetTop - offsetBottom - statusBarHeight))
        searchField.isEnabled = false
        searchField.borderStyle = .none
        searchField.backgroundColor = UIColor.white
        searchField.layer.cornerRadius = 16.0
        searchField.layer.borderWidth = 1.0
        searchField.layer.borderColor = UIColor.init(hexString: "#dddddd").cgColor
        searchField.layer.masksToBounds = false
        // set search field margin
        let paddingLeftView : UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: offsetX, height: searchField.frame.size.height))
        let paddingRightView : UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: offsetX, height: searchField.frame.size.height))
        searchField.leftView = paddingLeftView
        searchField.rightView = paddingRightView
        searchField.leftViewMode = .always
        searchField.rightViewMode = .always
        searchField.font = AppFonts.small
        searchField.textAlignment = .left
        if (AppConfig.currentLanguage == .arabic) {
            searchField.textAlignment = .right
        }
        searchField.placeholder = "HOME_FILTER_SEARCH_PLACEHOLDER".localized
        searchView.addSubview(searchField)
        // search view touch action
        searchView.tapAction {
            // open search screen
            // ActionShowSearch.execute()
        }
        UIApplication.shared.keyWindow?.addSubview(searchView)
        // show with animation
        if animated {
            UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: {
                self.searchView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.navigationController!.navigationBar.frame.size.height + statusBarHeight)
            }, completion: nil)
        } else {
            self.searchView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.navigationController!.navigationBar.frame.size.height + statusBarHeight)
        }
    }
    
    func hideSearchHeader(animated: Bool) {
        var frame = self.searchView.frame
        frame.origin.y -= frame.size.height
        // show with animation
        if animated {
            UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: UIViewAnimationOptions(), animations: {
                self.searchView.frame = frame
            }) { (finished) in
                self.searchView.removeFromSuperview()
            }
        } else {
            self.searchView.frame = frame
            self.searchView.removeFromSuperview()
        }
    }
    
    //MARK: UIGuesture recognizer delegate
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @IBAction func unwindToRoot(segue: UIStoryboardSegue)
    {
        print("unwind!!")
    }
    
    
    func pushViewController(viewControllerId:String,storyBoard:UIStoryboard){
        
        let vc = storyBoard.instantiateViewController(withIdentifier: viewControllerId)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func presentViewController(viewControllerId:String,storyBoard:UIStoryboard){
        
        let vc = storyBoard.instantiateViewController(withIdentifier: viewControllerId)
        self.present(vc, animated: true, completion: nil)
        
    }
}


