//
// Created by Liam De Grey on 16/04/18.
// Copyright (c) 2018 liamdegrey. All rights reserved.
//

import Foundation
import RxSwift


protocol BaseHttpBroker {
    var baseUrl: URL { get }
}

extension BaseHttpBroker {

    func get<Response: Codable>(from path: String, headers: [String: String]? = nil, parameters: [String: String]? = nil) -> Observable<Response> {
        var urlRequest = createRequest(for: path, headers: headers, parameters: parameters)
        urlRequest?.httpMethod = "GET"

        return executeRequest(urlRequest: urlRequest)
    }

    func post<Body: Codable, Response: Codable>(body: Body, to path: String, headers: [String: String]? = nil, parameters: [String: String]? = nil) -> Observable<Response> {
        var urlRequest = createRequest(for: path, headers: headers, parameters: parameters)
        urlRequest?.httpMethod = "POST"
        urlRequest?.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let encodedBody = try? JSONEncoder().encode(body) {
            urlRequest?.httpBody = encodedBody
        } else {
            urlRequest = nil
        }

        return executeRequest(urlRequest: urlRequest)
    }
}

//MARK: Private functions

private extension BaseHttpBroker {

    func createRequest(for path: String, headers: [String: String]?, parameters: [String: String]?) -> URLRequest? {
        var urlComponents = URLComponents(url: baseUrl.appendingPathComponent(path), resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = parameters?.map {
            URLQueryItem(name: String($0), value: String($1))
        }

        if let url = urlComponents?.url {
            var urlRequest = URLRequest(url: url)
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            urlRequest.allHTTPHeaderFields = headers
            return urlRequest
        } else {
            return nil
        }
    }

    func executeRequest<Response: Codable>(urlRequest: URLRequest?) -> Observable<Response> {
        return Observable<Response>.create { observer in
            var dataTask: URLSessionDataTask? = nil

            if let urlRequest = urlRequest {
                dataTask = URLSession.shared.dataTask(with: urlRequest) { (jsonData, rawResponse, error) in
                    var parsedResponse: Response? = nil
                    var parsedError: ErrorDto? = nil

                    if let jsonData = jsonData {
                        if let statusCode = (rawResponse as? HTTPURLResponse)?.statusCode, statusCode < 200 || statusCode > 299 {
                            parsedError = try? JSONDecoder().decode(ErrorDto.self, from: jsonData)
                        } else {
                            parsedResponse = try? JSONDecoder().decode(Response.self, from: jsonData)
                        }
                    }

                    if let response = parsedResponse {
                        observer.onNext(response)
                    } else if let error = parsedError {
                        observer.onError(error)
                    } else {
                        observer.onError(ErrorDto(statusCode: 500, message: "Invalid response"))//TODO: Localize
                    }

                    observer.onCompleted()
                }

                dataTask?.resume()
            } else {
                observer.onError(ErrorDto(statusCode: 400, message: "Invalid request"))//TODO: Localize
                observer.onCompleted()
            }

            return Disposables.create {
                dataTask?.cancel()
            }
        }
    }
}