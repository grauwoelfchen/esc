use std::env;
use std::ffi::CString;
use std::process::exit;

use nix::unistd::{execve, fork, ForkResult};

fn run() -> i32 {
    match fork() {
        Ok(ForkResult::Parent { .. }) => {
            println!("Hello, from parent");
            0
        },
        Ok(ForkResult::Child) => {
            // fork returns 0
            let path = CString::new("/bin/echo").unwrap();

            let argv = [
                CString::new("echo").unwrap(),
                CString::new("Hello, from child").unwrap(),
            ];

            // https://docs.rs/nix/0.15.0/src/nix/unistd.rs.html#688
            let environ: Vec<_> = env::vars()
                .map(|(k, v)| CString::new(format!("{}={}", k, v)).unwrap())
                .collect();

            let _ = execve(&path, &argv, &environ[..]);

            // never called
            exit(1)
        },
        Err(_) => {
            eprintln!("fork");
            1
        },
    }
}

fn main() {
    let result = run();
    exit(result);
}
