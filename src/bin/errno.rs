use std::process::exit;

use nix::errno::Errno;

fn run() -> i32 {
    for i in 0..255 {
        let errno = Errno::from_i32(i);
        println!("{} {}", i, errno.desc());
    }
    0
}

fn main() {
    let result = run();
    exit(result);
}
