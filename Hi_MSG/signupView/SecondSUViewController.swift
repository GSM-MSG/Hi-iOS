//
//  SecondSUViewController.swift
//  Hi_MSG ( made by Park Gunwoo )
//
//  Created by GSM02 on 2022/11/10.
//

import Foundation
import UIKit
import SnapKit
import Then

class SecondSUViewController: UIViewController {
    
    var tFCheck: Bool = false // textField Check
    var cnBCheck: Bool = false // cnButton Check
    
    let emailTextField = UITextField().then{
        $0.borderStyle = .none
        $0.placeholder = "이메일을 입력해주세요"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    let welcomeUILabel = UILabel().then {
        $0.text = "이메일 인증하기"
        $0.font = UIFont(name: "Pretendard-ExtraBold", size: 34)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    let subWelcomeUILabel = UILabel().then {
        $0.text = "보안을 위해 이메일 인증이 필요해요!"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    let nameExplainUILabel = UILabel().then {
        $0.text = "이메일도 알려주세요!"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }
    let nextStepUIButton = UIButton().then {
        $0.setTitle("얼마 안 남았어요!", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 24)
        $0.backgroundColor = UIColor(rgb: 0x999999)
        $0.addTarget(self, action: #selector(aftercomplete), for: .touchUpInside) //함수 () 쓰지 않아도 되네 매개 변수 있는데
    }
    let cnUIButton = UIButton().then { // cirtification number 인증번호
        $0.setTitle("인증번호 발송", for: .normal)
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.setTitleColor(UIColor(rgb: 0xFFC033), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 15)
    }
    
    let underLineView = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    let backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(rgb: 0xFFD068)
        
        defaultSetting()
        
    }
    
    func defaultSetting() {
        view.backgroundColor = .white
        view.addSubviews(welcomeUILabel, subWelcomeUILabel, nameExplainUILabel, emailTextField, nextStepUIButton, underLineView, cnUIButton)
        autolayoutSetting()
    }
    
    func autolayoutSetting() {
        self.welcomeUILabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view).offset(87)
            make.leading.equalTo(self.view).offset(16)
        }
        self.subWelcomeUILabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.welcomeUILabel.snp.bottom)
            make.leading.equalTo(self.welcomeUILabel.snp.leading).inset(1)
        }
        self.nameExplainUILabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.subWelcomeUILabel.snp.bottom).offset(123)
            make.leading.equalTo(self.view).offset(20)
        }
        self.emailTextField.snp.makeConstraints{ (make) in
            make.top.equalTo(self.nameExplainUILabel.snp.bottom).offset(12)
            make.leading.equalTo(self.view).offset(24)
            make.trailing.equalTo(self.view).inset(24)
        }
        self.nextStepUIButton.snp.makeConstraints{ (make) in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        self.underLineView.snp.makeConstraints{ (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(12)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).inset(20)
            make.height.equalTo(2)
        }
        self.cnUIButton.snp.makeConstraints{ (make) in
            make.top.equalTo(self.emailTextField.snp.top)
            make.bottom.equalTo(self.emailTextField.snp.bottom)
            make.trailing.equalTo(self.view.snp.trailing).inset(28)
        }
    }
    
    @objc func aftercomplete(_ sender: UIButton){
        if tFCheck == true {
            let vc = ThirdSUViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        emailCirtification()
    }
    
    func emailCirtification() {
        
        var id = emailTextField.text ?? "" //optional을 위해 string 뒤에 ?를 붙여준다.
        
        if id.count == 16{
            let firstIdIndex = id.index(id.startIndex, offsetBy: 6) // 왜 offsetBy 6 에서 16까지 인가요?
            let lastIdIndex = id.index(id.startIndex, offsetBy: 16)
            let mail = id[firstIdIndex..<lastIdIndex]
            if mail == "@gsm.hs.kr"{
                cnBCheck = true
                print("cnBCheck is true")
            }
            else {
                cnBCheck = false
            }
        }
    }
}
