import Foundation
import UIKit
import SnapKit
import Then
import Alamofire

final class NoticeViewController: BaseViewController {
    
    private let backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
    
    private var deleteMode : Bool = false
    
    private let deleteSymbol = UIImage(systemName: "minus.circle.fill")
    
    private let title_Label = UILabel().then {
        $0.text = "공지사항"
        $0.font = .hi_MSG(size: 24, family: .extraBold)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let notice1_Button = UIButton().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.addTarget(self, action: #selector(goToContentsView), for: .touchUpInside)
        $0.addTarget(self, action: #selector(turnUpDeleteMode), for: .touchDragOutside)
    }
    
    lazy var deleteSymbol_notice1_Button = UIButton().then {
        $0.isHidden = true
        $0.setImage(deleteSymbol, for: .normal)
        $0.tintColor = UIColor(rgb: 0xDF2020)
        $0.addTarget(self, action: #selector(deleteNotice), for: .touchUpInside)
    }
    
    private let title_notice1_Label = UILabel().then {
        $0.text = "12/20(화) 홈베이스 이용 공지"
        $0.font = .hi_MSG(size: 20, family: .bold)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let time_notice1_Label = UILabel().then {
        $0.text = "2022.12.20 11:00"
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let from_notice1_Label = UILabel().then {
        $0.text = "이명규T"
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let notice2_Button = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(goToContentsView), for: .touchUpInside)
        $0.addTarget(self, action: #selector(turnUpDeleteMode), for: .touchDragOutside)
    }
    
    lazy var deleteSymbol_notice2_Button = UIButton().then {
        $0.isHidden = true
        $0.setImage(deleteSymbol, for: .normal)
        $0.tintColor = UIColor(rgb: 0xDF2020)
        $0.addTarget(self, action: #selector(deleteNotice), for: .touchUpInside)
    }
    
    private let title_notice2_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 20, family: .bold)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let time_notice2_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let from_notice2_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let notice3_Button = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(goToContentsView), for: .touchUpInside)
        $0.addTarget(self, action: #selector(turnUpDeleteMode), for: .touchDragOutside)
    }
    
    lazy var deleteSymbol_notice3_Button = UIButton().then {
        $0.setImage(deleteSymbol, for: .normal)
        $0.tintColor = UIColor(rgb: 0xDF2020)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(deleteNotice), for: .touchUpInside)
    }
    
    private let title_notice3_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 20, family: .bold)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let time_notice3_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let from_notice3_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let notice4_Button = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(goToContentsView), for: .touchUpInside)
        $0.addTarget(self, action: #selector(turnUpDeleteMode), for: .touchDragOutside)
    }
    
    lazy var deleteSymbol_notice4_Button = UIButton().then {
        $0.isHidden = true
        $0.setImage(deleteSymbol, for: .normal)
        $0.tintColor = UIColor(rgb: 0xDF2020)
        $0.addTarget(self, action: #selector(deleteNotice), for: .touchUpInside)
    }
    
    private let title_notice4_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 20, family: .bold)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let time_notice4_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let from_notice4_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let notice5_Button = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0xFFFFFF)
        $0.layer.cornerRadius = 8
        $0.addTarget(self, action: #selector(goToContentsView), for: .touchUpInside)
        $0.addTarget(self, action: #selector(turnUpDeleteMode), for: .touchDragOutside)
    }
    
    lazy var deleteSymbol_notice5_Button = UIButton().then {
        $0.isHidden = true
        $0.setImage(deleteSymbol, for: .normal)
        $0.tintColor = UIColor(rgb: 0xDF2020)
        $0.addTarget(self, action: #selector(deleteNotice), for: .touchUpInside)
    }
    
    private let title_notice5_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 20, family: .bold)
        $0.textColor = UIColor(rgb: 0x000000)
    }
    
    private let time_notice5_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let from_notice5_Label = UILabel().then {
        $0.text = ""
        $0.font = .hi_MSG(size: 16, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    private let allDeleteNoticeButton = UIButton().then {
        $0.isHidden = true
        $0.setTitle("전부 삭제", for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 17, family: .medium)
        $0.setTitleColor(UIColor(rgb: 0x4D4D4D), for: .normal)
        $0.addTarget(self, action: #selector(allDeleteNotice), for: .touchUpInside)
    }
    
    private let cancelDeletModeButton = UIButton().then {
        $0.isHidden = true
        $0.setTitle("취소", for: .normal)
        $0.titleLabel?.font = .hi_MSG(size: 17, family: .medium)
        $0.setTitleColor(UIColor(rgb: 0x4D4D4D), for: .normal)
        $0.addTarget(self, action: #selector(cancel_deleteNotice), for: .touchUpInside)
    }
    
    private let notExistNoticeLabel = UILabel().then {
        $0.isHidden = true
        $0.text = "- 글이 없어요 -"
        $0.font = .hi_MSG(size: 20, family: .medium)
        $0.textColor = UIColor(rgb: 0x999999)
    }
    
    lazy var goToResisterNoticeButton = UIButton().then {
        $0.backgroundColor = UIColor(rgb: 0x212121)
        $0.layer.cornerRadius = 0.5 * 64
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(goToResisterNoticeView), for: .touchUpInside)
    }
    
    private let plusSymbolImageView = UIImageView().then {
        $0.image = UIImage(systemName: "plus.circle.fill")
        $0.tintColor = UIColor(rgb: 0xFFC033)
        $0.layer.cornerRadius = 0.5 * 64
        $0.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeStatusBarBgColor(bgColor: UIColor.white)
        
        view.backgroundColor = UIColor(rgb: 0xF2F2F2)
        
        self.navigationItem.backBarButtonItem = backBarButtonItem
        backBarButtonItem.tintColor = UIColor(rgb: 0x000000)
        
        
        let leftButtonItem1_Image = UIImage(named: "HI_LOGO_2")
        
        let leftButtonItem = UIBarButtonItem(image: leftButtonItem1_Image, style: .plain, target: self, action: nil)
        leftButtonItem.tintColor = UIColor(rgb: 0xFFC033)
        navigationItem.leftBarButtonItem = leftButtonItem
        
        let largeFont = UIFont.systemFont(ofSize: 100)
        
        let largeFontConfiguration = UIImage.SymbolConfiguration(font: largeFont)
        
        let rightButtonItem1_Symbol = UIImage(systemName: "person.circle.fill", withConfiguration: largeFontConfiguration)
        
        let rightButtonItem = UIBarButtonItem(image: rightButtonItem1_Symbol, style: .plain, target: self, action: nil)
        rightButtonItem.tintColor = UIColor(rgb: 0xD9D9D9)
        
        let mediumFont = UIFont.systemFont(ofSize: 15)
        
        let mediumFontConfiguration = UIImage.SymbolConfiguration(font: mediumFont)
        
        let rightButtonItem2_Symbol = UIImage(systemName: "bell.badge.fill", withConfiguration: mediumFontConfiguration)
        
        let rightButtonItem2 = UIBarButtonItem(image: rightButtonItem2_Symbol, style: .plain, target: self, action: nil)
        rightButtonItem2.tintColor = UIColor(rgb: 0x4D4D4D)
        
        navigationItem.rightBarButtonItems = [rightButtonItem2, rightButtonItem]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backgroundColor = UIColor(rgb: 0xFFFFFF)
    }
    
    override func addView() {
        view.addSubviews(
            title_Label,
            notice1_Button,
            deleteSymbol_notice1_Button,
            title_notice1_Label,
            time_notice1_Label,
            from_notice1_Label,
            notice2_Button,
            deleteSymbol_notice2_Button,
            title_notice2_Label,
            time_notice2_Label,
            from_notice2_Label,
            notice3_Button,
            deleteSymbol_notice3_Button,
            title_notice3_Label,
            time_notice3_Label,
            from_notice3_Label,
            notice4_Button,
            deleteSymbol_notice4_Button,
            title_notice4_Label,
            time_notice4_Label,
            from_notice4_Label,
            notice5_Button,
            deleteSymbol_notice5_Button,
            title_notice5_Label,
            time_notice5_Label,
            from_notice5_Label,
            allDeleteNoticeButton,
            cancelDeletModeButton,
            notExistNoticeLabel,
            goToResisterNoticeButton,
            plusSymbolImageView
        )
    }
    
    override func setLayout() {
        self.title_Label.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            $0.leading.equalTo(self.view).offset(20)
        }
        self.notice1_Button.snp.makeConstraints {
            $0.top.equalTo(self.title_Label.snp.bottom).offset(40)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(80)
        }
        self.deleteSymbol_notice1_Button.snp.makeConstraints {
            $0.centerY.equalTo(self.notice1_Button.snp.centerY)
            $0.leading.equalTo(self.notice1_Button.snp.leading).inset(16)
        }
        self.title_notice1_Label.snp.makeConstraints {
            $0.top.equalTo(self.notice1_Button.snp.top).inset(8)
            $0.leading.equalTo(self.notice1_Button.snp.leading).inset(16)
        }
        self.time_notice1_Label.snp.makeConstraints {
            $0.top.equalTo(self.title_notice1_Label.snp.bottom).offset(4)
            $0.leading.equalTo(self.notice1_Button.snp.leading).inset(16)
        }
        self.from_notice1_Label.snp.makeConstraints {
            $0.bottom.equalTo(self.notice1_Button.snp.bottom).inset(6)
            $0.trailing.equalTo(self.notice1_Button.snp.trailing).inset(16)
        }
        self.notice2_Button.snp.makeConstraints {
            $0.top.equalTo(self.notice1_Button.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(80)
        }
        self.deleteSymbol_notice2_Button.snp.makeConstraints {
            $0.centerY.equalTo(self.notice2_Button.snp.centerY)
            $0.leading.equalTo(self.notice2_Button.snp.leading).inset(16)
        }
        self.title_notice2_Label.snp.makeConstraints {
            $0.top.equalTo(self.notice2_Button.snp.top).inset(8)
            $0.leading.equalTo(self.notice2_Button.snp.leading).inset(16)
        }
        self.time_notice2_Label.snp.makeConstraints {
            $0.top.equalTo(self.title_notice2_Label.snp.bottom).offset(4)
            $0.leading.equalTo(self.notice2_Button.snp.leading).inset(16)
        }
        self.from_notice2_Label.snp.makeConstraints {
            $0.bottom.equalTo(self.notice2_Button.snp.bottom).inset(6)
            $0.trailing.equalTo(self.notice2_Button.snp.trailing).inset(16)
        }
        self.notice3_Button.snp.makeConstraints {
            $0.top.equalTo(self.notice2_Button.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(80)
        }
        self.deleteSymbol_notice3_Button.snp.makeConstraints {
            $0.centerY.equalTo(self.notice3_Button.snp.centerY)
            $0.leading.equalTo(self.notice3_Button.snp.leading).inset(16)
        }
        self.title_notice3_Label.snp.makeConstraints {
            $0.top.equalTo(self.notice3_Button.snp.top).inset(8)
            $0.leading.equalTo(self.notice3_Button.snp.leading).inset(16)
        }
        self.time_notice3_Label.snp.makeConstraints {
            $0.top.equalTo(self.title_notice3_Label.snp.bottom).offset(4)
            $0.leading.equalTo(self.notice3_Button.snp.leading).inset(16)
        }
        self.from_notice3_Label.snp.makeConstraints {
            $0.bottom.equalTo(self.notice3_Button.snp.bottom).inset(6)
            $0.trailing.equalTo(self.notice3_Button.snp.trailing).inset(16)
        }
        self.notice4_Button.snp.makeConstraints {
            $0.top.equalTo(self.notice3_Button.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(80)
        }
        self.deleteSymbol_notice4_Button.snp.makeConstraints {
            $0.centerY.equalTo(self.notice4_Button.snp.centerY)
            $0.leading.equalTo(self.notice4_Button.snp.leading).inset(16)
        }
        self.title_notice4_Label.snp.makeConstraints {
            $0.top.equalTo(self.notice4_Button.snp.top).inset(8)
            $0.leading.equalTo(self.notice4_Button.snp.leading).inset(16)
        }
        self.time_notice4_Label.snp.makeConstraints {
            $0.top.equalTo(self.title_notice4_Label.snp.bottom).offset(4)
            $0.leading.equalTo(self.notice4_Button.snp.leading).inset(16)
        }
        self.from_notice4_Label.snp.makeConstraints {
            $0.bottom.equalTo(self.notice4_Button.snp.bottom).inset(6)
            $0.trailing.equalTo(self.notice4_Button.snp.trailing).inset(16)
        }
        self.notice5_Button.snp.makeConstraints {
            $0.top.equalTo(self.notice4_Button.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(self.view).inset(20)
            $0.height.equalTo(80)
        }
        self.deleteSymbol_notice5_Button.snp.makeConstraints {
            $0.centerY.equalTo(self.notice5_Button.snp.centerY)
            $0.leading.equalTo(self.notice5_Button.snp.leading).inset(16)
        }
        self.title_notice5_Label.snp.makeConstraints {
            $0.top.equalTo(self.notice5_Button.snp.top).inset(8)
            $0.leading.equalTo(self.notice5_Button.snp.leading).inset(16)
        }
        self.time_notice5_Label.snp.makeConstraints {
            $0.top.equalTo(self.title_notice5_Label.snp.bottom).offset(4)
            $0.leading.equalTo(self.notice5_Button.snp.leading).inset(16)
        }
        self.from_notice5_Label.snp.makeConstraints {
            $0.bottom.equalTo(self.goToResisterNoticeButton.snp.top).offset(-6)
            $0.trailing.equalTo(self.notice5_Button.snp.trailing).inset(16)
        }
        self.allDeleteNoticeButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(43)
            $0.trailing.equalTo(self.view).inset(74)
        }
        self.cancelDeletModeButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(43)
            $0.trailing.equalTo(self.view).inset(20)
        }
        self.notExistNoticeLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(85)
            $0.centerX.equalTo(self.view.snp.centerX)

        }
        self.goToResisterNoticeButton.snp.makeConstraints {
            $0.top.equalTo(self.notice5_Button.snp.top).offset(50)
            $0.trailing.equalTo(self.view).inset(28)
            $0.width.equalTo(64)
            $0.height.equalTo(64)
        }
        self.plusSymbolImageView.snp.makeConstraints {
            $0.top.equalTo(self.notice5_Button.snp.top).offset(50)
            $0.trailing.equalTo(self.view).inset(28)
            $0.width.equalTo(64)
            $0.height.equalTo(64)
        }
    }
    
    func deleteModeCancel() {
        deleteMode = false
        deleteSymbol_notice1_Button.isHidden = true
        deleteSymbol_notice2_Button.isHidden = true
        deleteSymbol_notice3_Button.isHidden = true
        deleteSymbol_notice4_Button.isHidden = true
        deleteSymbol_notice5_Button.isHidden = true
        allDeleteNoticeButton.isHidden = true
        cancelDeletModeButton.isHidden = true
    }
    
    @objc private func goToContentsView(_ sender: UIButton) {
        if deleteMode == false {
            let vc = NoticeContentsViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc private func turnUpDeleteMode(_ sender: UIButton) {
        deleteMode = true
        allDeleteNoticeButton.isHidden = false
        cancelDeletModeButton.isHidden = false
        deleteSymbol_notice1_Button.isHidden = false
        deleteSymbol_notice2_Button.isHidden = false
        deleteSymbol_notice3_Button.isHidden = false
        deleteSymbol_notice4_Button.isHidden = false
        deleteSymbol_notice5_Button.isHidden = false
    }
    
    @objc private func deleteNotice(_ sender: UIButton){
        let completed = UIAlertController(title: "공지글 삭제", message: "글을 삭제하면 복구할 수 없어요!\n 정말 삭제하실 건가요?", preferredStyle: .alert)
        completed.addAction(UIAlertAction(title: "취소", style: .default){_ in
        })
        completed.addAction(UIAlertAction(title: "삭제", style: .default){_ in
            print("삭제 하기")
            self.deleteModeCancel()
        })
        present(completed, animated: true, completion: nil)
    }
    
    @objc private func allDeleteNotice(_ sender: UIButton) {
        notice1_Button.isHidden = true
        notice2_Button.isHidden = true
        notice3_Button.isHidden = true
        notice4_Button.isHidden = true
        notice5_Button.isHidden = true
        title_notice1_Label.isHidden = true
        time_notice1_Label.isHidden = true
        from_notice1_Label.isHidden = true
        deleteMode = false
        deleteSymbol_notice1_Button.isHidden = true
        deleteSymbol_notice2_Button.isHidden = true
        deleteSymbol_notice3_Button.isHidden = true
        deleteSymbol_notice4_Button.isHidden = true
        deleteSymbol_notice5_Button.isHidden = true
        allDeleteNoticeButton.isHidden = true
        cancelDeletModeButton.isHidden = true
        notExistNoticeLabel.isHidden = false
    }
    
    @objc private func cancel_deleteNotice(_ sender: UIButton) {
        deleteModeCancel()
    }
    
    @objc private func goToResisterNoticeView(_ sender: UIButton) {
        let vc = ResisterNoticeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
