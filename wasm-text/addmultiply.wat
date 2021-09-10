(module
    (func $add (param $lhs i32) (param $rhs i32) (result i32)
        local.get $lhs
        local.get $rhs
        i32.add)
    (func $mul (param $value i32) (result i32)
        local.get $value
        i32.const 10
        i32.mul
    )
    (func (export "getAns") (param $lhs i32) (param $rhs i32) (result i32)
        local.get $lhs
        local.get $rhs
        call $add
        call $mul)
)
