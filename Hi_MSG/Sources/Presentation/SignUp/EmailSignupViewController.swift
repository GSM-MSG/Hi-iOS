import Foundation
import UIKit
import SnapKit
import Then

final class EmailSignupViewController: BaseViewController {
    
    private var nextStep: Bool = false

    private var SendCertificationNumber: Bool = false
    
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
    
    private let sendCertificationNumberButton = UIButton().then {
        $0.setTitle("인증번호 발송", for: .normal)
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.setTitleColor(UIColor(rgb: 0xFFC033), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 15, family: .regular)
        $0.addTarget(self, action: #selector(sendCertificationNumber), for: .touchUpInside)
    }
    
    private let nextStepButton = UIButton().then {
        $0.setTitle("얼마 안 남았어요!", for: .normal)
        $0.setTitleColor(UIColor(rgb: 0xFFFFFF), for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 22, family: .semiBold)
        $0.backgroundColor = UIColor(rgb: 0x999999)
        $0.addTarget(self, action: #selector(nextStepButtonDidTap), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(rgb: 0xFFD068)
    }
    
    override func addView() {
        view.addSubviews(
            welcomeLabel,
            subWelcomeLabel,
            emailExplainLabel,
            emailTextField,
            underLineView,
            sendCertificationNumberButton,
            nextStepButton
        )
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
        self.sendCertificationNumberButton.snp.makeConstraints {
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
        if SendCertificationNumber == false {
            emailFormatCheck()
        }
        else {
            certificationNumberCheck()
        }
    }
    
    func emailFormatCheck() {
        
        var id = emailTextField.text ?? ""
        
        if id.count == 16{
            let firstIdIndex = id.index(id.startIndex, offsetBy: 6)
            let lastIdIndex = id.index(id.startIndex, offsetBy: 16)
            let mail = id[firstIdIndex..<lastIdIndex]
            if mail == "@gsm.hs.kr"{
                SendCertificationNumber = true
                print("cnBCheck is true")
            }
            else {
                SendCertificationNumber = false
            }
        }
    }
    
    func certificationNumberCheck() {
        var id = emailTextField.text ?? ""
        if id == "0" {
            nextStep = true
            nextStepButton.backgroundColor = UIColor(rgb: 0xFFC033)
        }
        else {
            nextStep = false
            nextStepButton.backgroundColor = UIColor(rgb: 0x999999)
        }
    }
    
    @objc func sendCertificationNumber(_ sender: UIButton){
        if SendCertificationNumber == true {
            print("Send cirtification number.")
            emailExplainLabel.text = "인증번호는 여기에 써주세요!"
            emailTextField.placeholder = "인증번호를 입력해 주세요."
            emailTextField.text = ""
            sendCertificationNumberButton.setTitle("다시 받기", for: .normal)
        }
        else {
            print("이메일의 형식이 다릅니다.")
        }
    }
    
    @objc private func nextStepButtonDidTap(_ sender: UIButton){
        if nextStep == true {
            let vc = MakePasswordSignupViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
