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

class SecondSUViewController: BaseViewController {
    
    var nextStep: Bool = false // textField Check 텍스트 필드 값이 이메일 값과 같은가?
    var certifycationNumber: Bool = false // cnButton Check, textField 값이 이메일 형식과 같은 경우 이 멤버를 true 시켜준다. 버튼을 눌렀을 때 true 일 경우 인증번호 발송, false 일 경우 이메일의 형식이 다르다고 사용자에게 알려줌.
    
    let backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
    
    let emailTextField = UITextField().then{
        $0.borderStyle = .none
        $0.placeholder = "이메일을 입력해주세요"
        $0.textColor = UIColor(rgb: 0x000000)
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    let welcomeLabel = UILabel().then {
        $0.text = "이메일 인증하기"
        $0.font = UIFont(name: "Pretendard-ExtraBold", size: 34)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    let subWelcomeLabel = UILabel().then {
        $0.text = "보안을 위해 이메일 인증이 필요해요!"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    let emailExplainLabel = UILabel().then {
        $0.text = "이메일도 알려주세요!"
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }
    
    let nextStepButton = UIButton().then {
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
        $0.addTarget(self, action: #selector(cnBChecking), for: .touchUpInside)
    }
    
    let underLineView = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(rgb: 0xFFD068)
    }
        
    override func addView() {
        view.addSubviews(welcomeLabel, subWelcomeLabel, emailExplainLabel, emailTextField, nextStepButton, underLineView, cnUIButton)
    }
    
    override func setLayout() {
        self.welcomeLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view).offset(87)
            make.leading.equalTo(self.view).offset(16)
        }
        
        self.subWelcomeLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.welcomeLabel.snp.bottom)
            make.leading.equalTo(self.welcomeLabel.snp.leading).inset(1)
        }
        
        self.emailExplainLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.subWelcomeLabel.snp.bottom).offset(123)
            make.leading.equalTo(self.view).offset(20)
        }
        
        self.emailTextField.snp.makeConstraints{ (make) in
            make.top.equalTo(self.emailExplainLabel.snp.bottom).offset(12)
            make.leading.equalTo(self.view).offset(24)
            make.trailing.equalTo(self.view).inset(24)
        }
        
        self.nextStepButton.snp.makeConstraints{ (make) in
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
        if nextStep == true {
            let vc = ThirdSUViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func cnBChecking(_ sender: UIButton){
        if certifycationNumber == true {
            nextStep = false
            nextStepButton.backgroundColor = UIColor(rgb: 0x999999)
            print("Send cirtification number.")
            emailTextField.text = ""
            emailTextField.placeholder = "인증번호를 입력해 주세요."
            cnUIButton.setTitle("다시 받기", for: .normal)
        }
        else {
            print("이메일의 형식이 다릅니다.")
        }
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if certifycationNumber == false {
            emailCirtification()
        }
        else {
            certifycationNumberCheck()
        }
    }
    
    func certifycationNumberCheck() {
        var id = emailTextField.text ?? ""
        
        if id == "0" { // 아직 랜덤 번호를 이메일에 보내는 방법을 모르기 때문에 임의의 수 0을 다음 화면으로 가기 위해 지정해놓음.
            nextStep = true
            nextStepButton.backgroundColor = UIColor(rgb: 0xFFC033)
        }
        else {
            nextStep = false
            nextStepButton.backgroundColor = UIColor(rgb: 0x999999)
        }
    }
    
    func emailCirtification() {
        
        var id = emailTextField.text ?? "" //optional을 위해 string 뒤에 ?를 붙여준다.
        
        if id.count == 16{
            let firstIdIndex = id.index(id.startIndex, offsetBy: 6) // 왜 offsetBy 6 에서 16까지 인가요?
            let lastIdIndex = id.index(id.startIndex, offsetBy: 16)
            let mail = id[firstIdIndex..<lastIdIndex]
            if mail == "@gsm.hs.kr"{
                certifycationNumber = true
                print("cnBCheck is true")
            }
            else {
                certifycationNumber = false
            }
        }
    }
}