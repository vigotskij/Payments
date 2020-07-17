//
//  URLSession+extension.swift
//  PaymentTool
//
//  Created by Boris Sortino on 16/07/2020.
//  Copyright © 2020 Boris Sortino. All rights reserved.
//

import Foundation
extension URLSession {
    /// - parameters:
    ///     - data: Here it will be captured the Data from the response
    ///     - backendError: Bool telling us if the response was a 500~
    ///     - error: Error: Generic error
    typealias TaskCompletionHandler<DecodableType: Decodable> =
        (_ data: DecodableType?, _ backendError: Bool, _ error: Error?) -> Void

    func retrieveData<DecodableType: Decodable>(
        with url: URL,
        completionHandler: @escaping TaskCompletionHandler<DecodableType>) {
        retrieveDataTask(with: url,
                         completionHandler: completionHandler)
            .resume()
    }

    func pushData<EncodableType: Encodable, DecodableType: Decodable>(
        request: URLRequest,
        with dataToEncode: EncodableType,
        completionHandler: @escaping TaskCompletionHandler<DecodableType>) {
        pushDataTask(request: request,
                     from: dataToEncode,
                     completionHandler: completionHandler)?
            .resume()
    }

    /// This function will create a data task and will contain all the code related to error capture.
    /// - Parameters:
    ///   - url: Must contain the endpoint
    ///   - completionHandler: This will have the data or the elements to handle errors.
    /// - Returns: Will return a URLSessionDataTask to be resumed.
    private func retrieveDataTask<DecodableType: Decodable>(
        with url: URL,
        completionHandler: @escaping TaskCompletionHandler<DecodableType>)
        -> URLSessionDataTask {
            self.dataTask(with: url) { data, response, error in
                guard
                    let response = response as? HTTPURLResponse,
                    let data = data else {
                        completionHandler(nil, false, error)
                        return
                }
                if (200...299).contains(response.statusCode) {
                    self.handleResponse(with: data,
                                        completionHandler: completionHandler)
                } else if (500...599).contains(response.statusCode) {
                    completionHandler(nil, true, nil)
                }
            }
    }

    /// This function will create an upload task and will contain all the code related to error capture.
    /// - Parameters:
    ///   - request: Must contain the endpoint
    ///   - from dataToEncode: data to be encoded and pushed to the endpoint
    ///   - completionHandler: This will have the data or the elements to handle errors.
    /// - Returns: Will return a URLSessionUploadTask to be resumed.
    private func pushDataTask<EncodableType: Encodable, DecodableType: Decodable>(
        request: URLRequest,
        from dataToEncode: EncodableType,
        completionHandler: @escaping TaskCompletionHandler<DecodableType>)
        -> URLSessionUploadTask? {
            do {
                let postData = try JSONEncoder().encode(dataToEncode)
                return uploadTask(with: request, from: postData) { data, response, error in
                    guard
                        let response = response as? HTTPURLResponse,
                        let data = data else {
                            completionHandler(nil, false, error)
                            return
                    }
                    if (200...299).contains(response.statusCode) {
                        self.handleResponse(with: data, completionHandler: completionHandler)
                    } else if (500...599).contains(response.statusCode) {
                        completionHandler(nil, true, nil)
                    }
                }
            } catch {
                completionHandler(nil, false, error)
                return nil
            }
    }

    private func handleResponse<DecodableType: Decodable>(
        with data: Data,
        completionHandler: TaskCompletionHandler<DecodableType>) {
        #if !DEBUG
        do {
            let decodedData = try JSONDecoder()
                .decode(DecodableType.self, from: data)
            completionHandler(decodedData, false, nil)
        } catch {
            completionHandler(nil, false, error)
        }
        #else
        do {
            let decodedData = try JSONDecoder()
                .decode(DecodableType.self,
                        from: data)
            completionHandler(decodedData, false, nil)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        #endif
    }
}
