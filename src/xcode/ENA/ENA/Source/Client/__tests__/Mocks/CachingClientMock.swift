//
// Corona-Warn-App
//
// SAP SE and all other contributors
// copyright owners license this file to you under the Apache
// License, Version 2.0 (the "License"); you may not use this
// file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
//

import Foundation

final class CachingHTTPClientMock: CachingHTTPClient {

	static let staticAppConfig: SAP_ApplicationConfiguration = {
		let bundle = Bundle(for: CachingHTTPClientMock.self)
		// there is a test for this (`testStaticAppConfiguration`), let's keep it short.
		guard
			let fixtureUrl = bundle.url(forResource: "de-config-int-2020-09-25", withExtension: nil),
			let fixtureData = try? Data(contentsOf: fixtureUrl),
			let bucket = SAPDownloadedPackage(compressedData: fixtureData),
			let config = try? SAP_ApplicationConfiguration(serializedData: bucket.bin)
		else { return SAP_ApplicationConfiguration() }
		return config
	}()

	// MARK: AppConfigurationFetching

	typealias AppFetchHandler = (Result<SAP_ApplicationConfiguration, Error>) -> Void
	var onFetchAppConfiguration: ((Bool, @escaping AppFetchHandler) -> Void)?


//	func appConfiguration(forceFetch: Bool, completion: @escaping Completion) {
//		guard let handler = self.onFetchAppConfiguration else {
//			completion(.success(CachingClientMock.staticAppConfig))
//			return
//		}
//		handler(forceFetch, completion)
//	}
//
//	func appConfiguration(completion: @escaping Completion) {
//		appConfiguration(forceFetch: false, completion: completion)
//	}
}
