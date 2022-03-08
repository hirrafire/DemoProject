//
//  HomeViewController.swift
//  DemoProject
//
//  Created by Hira Saleem on 03/03/2022.
//

import UIKit
import Combine
protocol HomeViewControllerDelegate: AnyObject {
    func navigateToNextPage(_ result: UserDataRepresentable)
}
class HomeViewController: BaseViewController,ActivityIndicatorPresenter {
    
    var viewModel: HomeViewModel = HomeViewModel()
    var activityIndicator = UIActivityIndicatorView()
    public weak var delegate: HomeViewControllerDelegate?
    private var subscriptions = Set<AnyCancellable>()
    var results  =  [Results]()
    @IBOutlet weak var tableView: UITableView!
    private var tableCellClassName: String { String(describing: TableViewCell.self) }

    private lazy var dataSource: UITableViewDiffableDataSource<Int, TableViewCellViewModel> = {
        .init(tableView: tableView) { (tableView, indexPath, cellViewModel) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.tableCellClassName, for: indexPath) as? TableViewCell
            cell?.prepare(with: cellViewModel)
            return cell
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "HomeViewController"
        prepareViewModel()
        // Do any additional setup after loading the view.
    }
    
    private func prepareViewModel() {
        viewModel.fetchUser()
        viewModel.didUpdateDataSource = didUpdateDataSource

        
    }
    private func didUpdateDataSource() {
        
        DispatchQueue.main.async {
            self.set(self.viewModel.dataSource)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        bindViewModel()
    }
    // MARK: Configure dataSource
    override func configureDataSource() -> Void {
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
//        self.tableView.dataSource = self
        self.tableView.bounces = false
        self.tableView.tableFooterView = UIView()
    }
    //MARK: - BindingViewModel
    func bindViewModel() {
        //        viewModel.fetchUser()
        viewModel.$errorMessage.compactMap { $0 }.sink(receiveValue: { error in
            Print(error.localizedDescription)
            }).store(in: &subscriptions)
        viewModel.$result.compactMap { $0 }.sink { [weak self] result in
            self?.results = result
            self?.tableView.reloadData()
            
        }.store(in: &subscriptions)
        viewModel.$showHud.sink { [weak self] showHud in
            showHud == true ? self?.showActivityIndicator(): self?.hideActivityIndicator()
        }.store(in: &subscriptions)
    }
    
    private func set(_ newItems: [TableViewCellViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, TableViewCellViewModel>()
        snapshot.appendSections([0])
        snapshot.appendItems(newItems, toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataSource.itemIdentifier(for: indexPath)
        self.delegate?.navigateToNextPage(item!.model)
    }
}
