//
//  ViewController.swift
//  Likes
//
//  Created by ExtYabecchi on 2017/10/30.
//  Copyright © 2017年 ExtYabecchi. All rights reserved.
//

import UIKit
import TwitterKit
import RxSwift
import RxCocoa
import RxDataSources

class LikesListViewController: UIViewController, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    
    private var viewModel: LikesListViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LikesListViewModel()
        
        viewModel.items
            .bind(to: tableView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx
            .itemSelected
            .map { indexPath in
                return (indexPath, self.viewModel.dataSource[indexPath])
            }
            .subscribe(onNext: { indexPath, model in
                
            })
            .disposed(by: disposeBag)
        
        tableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}


//extension LikesListViewController: UITableViewDelegate {
//
//}

