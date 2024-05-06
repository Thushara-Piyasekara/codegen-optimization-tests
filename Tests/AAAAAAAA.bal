// Copyright (c) 2024, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied. See the License for the
// specific language governing permissions and limitations
// under the License.

type R record {
    int x;
    int y;
};

typedesc<record {}> t = R;

public function main() {
    any aaa = foo(t);
    if aaa is R {
        R rrr = aaa;
    }
}

function foo(typedesc<anydata> typeDesc) returns any {
    map<int> m = {x: 1, y: 2};
    return checkpanic m.cloneWithType(typeDesc);
}
