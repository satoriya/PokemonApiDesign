//
//  ListPokemonInteractor.swift
//  PokemonApiDesign
//
//  Created by Phincon on 15/03/23.
//

import Foundation

protocol ListInteractorInput: AnyObject {
    func set(presenter: ListInteractorOutput)
    func fetchListData(urlString: String)
    func fetchPokemonDetail(urlString: String)
}

protocol ListInteractorOutput: AnyObject {
    func onSuccessFetch(pokemons: ListPokemonModel)
    func onFailedFetch(error: Error)
    func onResponse(responses: URLResponse)
}

final class ListPokemonInteractor {
    private let apiService: ApiServiceProtocol
    private(set) weak var presenter: ListInteractorOutput?
    private var url: URL!
    
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
}

extension ListPokemonInteractor: ListInteractorInput {
    func set(presenter: ListInteractorOutput) {
        self.presenter = presenter
    }
    
    func fetchListData(urlString: String) {
        self.apiService.callApi(model: ListPokemonModel.self) { [weak self] listResult in
            guard let `self` = self else { return }
            switch listResult {
            case .success(let success):
                self.presenter?.onSuccessFetch(pokemons: success)
            case .failure(let failure):
                self.presenter?.onFailedFetch(error: failure)
            }
        } response: {[weak self] responses in
            guard let `self` = self else { return }
            self.presenter?.onResponse(responses: responses)
        }

    }
    
    func fetchPokemonDetail(urlString: String) {
        // to be continued
    }
    
}
