use std::process::exit;

use libc::_exit;
use nix::unistd::{fork, ForkResult};

fn run() -> i32 {
    match unsafe { fork() } {
        Ok(ForkResult::Parent { child, .. }) => {
            println!("parent process, (child: {})", child);
            0
        },
        Ok(ForkResult::Child) => {
            // fork returns 0
            println!("child process");
            unsafe {
                _exit(0);
            }
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
