# Copyright 2015 The Kubernetes Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM envisia/ubuntu-slim:0.5

RUN apt-get update && apt-get install -y --no-install-recommends bash

COPY build.sh /build.sh

# 1.4.0
# ENV VERSION 1.4.0
# ENV SHA256 2d8a847a6fd4bb77f7909d21d6d732f0bb13109ccc08c6fc3e1cd8d258ad3cea

# master
ENV VERSION 497f1733dd95ae2ccf5e75ac09913da863113c66
ENV SHA256 015c04390fc8230995694dead253caf50490b1712f4b7ffa6844f711b94911e9

RUN /build.sh
