//
//  ChatViewController.swift
//  Chat
//
//  Created by Paweł Bednorz on 23/06/2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class ChatViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        }
    }
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var sendButton: UIButton!
    
    private let viewModel: ChatViewModelProtocol = ChatViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinding()
        setupSubscription()
    }
    
    private func setupBinding() {
        textView.rx.text
            .bind(to: viewModel.textFieldContent)
            .disposed(by: disposeBag)
        
        textView.rx.text
            .map { $0?.isEmpty == false }
            .bind(to: sendButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        sendButton.rx.tap
            .bind(to: viewModel.sendButtonDidTap)
            .disposed(by: disposeBag)
        
        let dataSource = makeRxDataSource()
        viewModel.dataSource
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func setupSubscription() {
        sendButton.rx.tap
            .subscribe(with: self) { owner, _ in
                owner.textView.text = ""
            }
            .disposed(by: disposeBag)
    }
    
    private func makeRxDataSource() -> RxTableViewSectionedReloadDataSource<SectionModel<String, ChatCell.Model>> {
        return .init(configureCell: { _, tableView, indexPath, item in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatCell.cellIdentifier,
                                                           for: indexPath) as? ChatCell else {
                fatalError("Whoops someting went wrong")
            }
            
            cell.configure(with: item)
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            
            return cell
        })
    }
}
