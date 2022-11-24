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

class SecondSignUpViewController: BaseViewController {
    
    private var nextStep: Bool = false // 인증번호 형식이 같으면 true 시켜줌.
    private var SendCirtifycationNumber: Bool = false // textField 값이 이메일 형식과 같은 경우 이 멤버를 true 시켜준다. 인증번호 받기 버튼을 눌렀을 때 true 일 경우 인증번호 발송, false 일 경우 이메일의 형식이 다르다고 사용자에게 알려줌.
    
    private let backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
    
    private let welcomeLabel = UILabel().then {
        $0.text = "이메일 인증하기"
        $0.font = .hi_MSG(size: 34, family: .extraBold)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let subWelcomeLabel = UILabel().then {
        $0.text = "보안을 위해 이메일 인증이 필요해요!"
        $0.font = .hi_MSG(size: 16, family: .semiBold)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let emailExplainLabel = UILabel().then {
        $0.text = "이메일도 알려주세요!"
        $0.font = .hi_MSG(size: 12, family: .medium)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }
    
    private let emailTextField = UITextField().then{
        $0.borderStyle = .none
        $0.placeholder = "이메일을 입력해주세요"
        $0.font = .hi_MSG(size: 17, family: .regular)
        $0.textColor = UIColor(rgb: 0x000000)
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private let underLineView = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    private let sendCirtifycationNumberButton = UIButton().then { // cirtification number 인증번호
        $0.setTitle("인증번호 발송", for: .normal)
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.setTitleColor(UIColor(rgb: 0xFFC033), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 15, family: .regular)
        $0.addTarget(self, action: #selector(sendCirtifycationNumber), for: .touchUpInside)
    }
    
    private let nextStepButton = UIButton().then {
        $0.setTitle("얼마 안 남았어요!", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 22, family: .semiBold)
        $0.backgroundColor = UIColor(rgb: 0x999999)
        $0.addTarget(self, action: #selector(aftercomplete), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(rgb: 0xFFD068)
    }
    
    override func addView() {
        view.addSubviews(welcomeLabel, subWelcomeLabel, emailExplainLabel, emailTextField, underLineView, sendCirtifycationNumberButton, nextStepButton)
    }
    
    override func setLayout() {
        self.welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(self.view).offset(87)
            $0.leading.equalTo(self.view).offset(16)
        }
        self.subWelcomeLabel.snp.makeConstraints {
            $0.top.equalTo(self.welcomeLabel.snp.bottom)
            $0.leading.equalTo(self.welcomeLabel.snp.leading).inset(1)
        }
        self.emailExplainLabel.snp.makeConstraints {
            $0.top.equalTo(self.subWelcomeLabel.snp.bottom).offset(123)
            $0.leading.equalTo(self.view).offset(20)
        }
        self.emailTextField.snp.makeConstraints {
            $0.top.equalTo(self.emailExplainLabel.snp.bottom).offset(12)
            $0.leading.equalTo(self.view).offset(24)
            $0.trailing.equalTo(self.view).inset(24)
        }
        self.underLineView.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.leading.equalTo(self.view).offset(20)
            $0.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(2)
        }
        self.sendCirtifycationNumberButton.snp.makeConstraints {
            $0.top.equalTo(self.emailTextField.snp.top)
            $0.bottom.equalTo(self.emailTextField.snp.bottom)
            $0.trailing.equalTo(self.view.snp.trailing).inset(28)
        }
        self.nextStepButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if SendCirtifycationNumber == false {
            emailFormatCheck()
        }
        else {
            certifycationNumberCheck()
        }
    }
    
    func emailFormatCheck() {
        
        var id = emailTextField.text ?? "" //optional을 위해 string 뒤에 ?를 붙여준다.
        
        if id.count == 16{
            let firstIdIndex = id.index(id.startIndex, offsetBy: 6)
            let lastIdIndex = id.index(id.startIndex, offsetBy: 16)
            let mail = id[firstIdIndex..<lastIdIndex]
            if mail == "@gsm.hs.kr"{
                SendCirtifycationNumber = true
                print("cnBCheck is true")
            }
            else {
                SendCirtifycationNumber = false
            }
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
    
    @objc func sendCirtifycationNumber(_ sender: UIButton){
        if SendCirtifycationNumber == true {
            print("Send cirtification number.") // 백엔드 통신 부분
            emailExplainLabel.text = "인증번호는 여기에 써주세요!"
            emailTextField.placeholder = "인증번호를 입력해 주세요."
            emailTextField.text = ""
            sendCirtifycationNumberButton.setTitle("다시 받기", for: .normal)
        }
        else {
            print("이메일의 형식이 다릅니다.") // 경고창 출력 부분
        }
    }
    
    @objc private func aftercomplete(_ sender: UIButton){
          if nextStep == true {
              let vc = ThirdSignUpViewController()
              navigationController?.pushViewController(vc, animated: true)
          }
      }
}
