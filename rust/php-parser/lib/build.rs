extern crate lalrpop;

fn main() {
    //   lalrpop::process_root().unwrap();

    let _ = lalrpop::Configuration::new()
        .generate_in_source_tree()
        .process();
}
