import Foundation
import UIKit
import SnapKit
import Then

final class NameSignupViewController: BaseViewController {
    
    private var nextStep: Bool = false
    
    private let backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
    
    private let welcomeLabel = UILabel().then {
        $0.text = "처음이신가요?"
        $0.font = .hi_MSG(size: 34, family: .extraBold)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let subWelcomeLabel = UILabel().then {
        $0.text = "HI에 오신 걸 환영해요!"
        $0.font = .hi_MSG(size: 16, family: .semiBold)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let nameExplainLabel = UILabel().then {
        $0.text = "이름을 알려주실래요?"
        $0.font = .hi_MSG(size: 12, family: .medium)
        $0.textColor = UIColor(rgb: 0x4D4D4D)
    }
    
    private let nameTextField = UITextField().then{
        $0.borderStyle = .none
        $0.placeholder = "실명을 입력해주세요!"
        $0.font = .hi_MSG(size: 17, family: .regular)
        $0.textColor = UIColor(rgb: 0x000000)
        $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private let underLineView = UIView().then {
        $0.backgroundColor = .init(UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))
    }
    
    private let nextStepButton = UIButton().then {
        $0.setTitle("다음 단계로 가볼까요?", for: .normal)
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
        view.addSubviews(welcomeLabel, subWelcomeLabel, nameExplainLabel, nameTextField, underLineView, nextStepButton)
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
        self.nameExplainLabel.snp.makeConstraints {
            $0.top.equalTo(self.subWelcomeLabel.snp.bottom).offset(123)
            $0.leading.equalTo(self.view).offset(20)
        }
        self.nameTextField.snp.makeConstraints {
            $0.top.equalTo(self.nameExplainLabel.snp.bottom).offset(12)
            $0.leading.equalTo(self.view).offset(24)
            $0.trailing.equalTo(self.view).inset(24)
        }
        self.underLineView.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(12)
            $0.leading.equalTo(self.view).offset(20)
            $0.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(2)
        }
        self.nextStepButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(80)
        }
    }
    
    @objc private func textFieldDidChange(_ sender: Any?) {
        if nameTextField.text?.count ?? 0 >= 1{
            nextStepButton.backgroundColor = UIColor(rgb: 0xFFC033)
            nextStep = true
        }
        else {
            nextStepButton.backgroundColor = UIColor(rgb: 0x999999)
            nextStep = false
        }
    }
    
    @objc private func aftercomplete(_ sender: UIButton){
        if nextStep == true {
            let vc = EmailSignupViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}



