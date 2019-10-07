# Esc

Esc: Examples of System Call

This is a collection written in Rust (using [libc](https://github.com/rust-lang/libc) and [nix](
https://github.com/nix-rust/nix)) just trying usage examples  
from basic C linux system call references for fun.


## Usage

```zsh
% make run:errno | less
% make run:fork
% make run:execve
...
```

## Links

* [System Interfaces - The Open Group Base Specifications Issue 7, 2018 edition](
https://pubs.opengroup.org/onlinepubs/9699919799/functions/contents.html)
* [rust-lang/libc](https://github.com/rust-lang/libc)
* [nix-rust/nix](https://github.com/nix-rust/nix)


## License

This project is distributed under the license.

```
Esc
Copyright 2019 Yasuhiro Яша Asaka
```

`Apache-2.0`

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

See [LICENSE](LICENSE).
