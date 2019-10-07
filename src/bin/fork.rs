use std::process::exit;

use nix::unistd::{fork, ForkResult};

fn run() -> i32 {
    match fork() {
        Ok(ForkResult::Parent { child, .. }) => {
            println!("{}, (child: {})", "parent process", child);
            0
        },
        Ok(ForkResult::Child) => {
            // fork returns 0
            println!("{}", "child process");
            exit(0);
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
