pub type GbTree(k, v)

@external(erlang, "gb_trees", "empty")
pub fn new_gb_tree() -> GbTree(k, v) 

pub fn insert(tree: GbTree(k, v), key: k, value: v) -> GbTree(k, v) {
    external_insert(key, value, tree)
}

pub fn delete(tree: GbTree(k, v), key: k) -> GbTree(k, v) {
    external_delete(key, tree)
}


@external(erlang, "gb_trees", "insert")
fn external_insert(key: k, value: v, tree: GbTree(k, v)) -> GbTree(k,v)

@external(erlang, "gb_trees", "delete_any")
fn external_delete(key: k, tree: GbTree(k, v)) -> GbTree(k, v)
