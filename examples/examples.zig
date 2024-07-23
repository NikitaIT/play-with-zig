const std = @import("std");
const assert = std.testing;
const expect = std.testing.expect;
// zig test ./examples/examples.zig
test "assignment" {
    const constant: i32 = 5; // signed 32-bit constant
    var variable: u32 = 5000; // unsigned 32-bit variable
    variable = variable + variable;
    variable = variable / 2;

    // @as performs an explicit type coercion
    const inferred_constant = @as(i32, 5);
    var inferred_variable = @as(u32, 5000);
    inferred_variable = inferred_variable + 1;
    inferred_variable -= 1;

    // test without 'try' shows examples/assignment.zig:17:23: error: error union is ignored
    try assert.expectEqual(constant, inferred_constant);
    try assert.expectEqual(variable, inferred_variable);
}

test "signed 32-bit int cannot represent all possible unsigned 32-bit values - Fixed" {
    const a: i32 = undefined; // Assign a valid value to 'a'
    const b: u32 = undefined; // Assign a valid value to 'b'
    try assert.expectEqual(undefined, b);
    try assert.expectEqual(undefined, a);
}

test "undefined is equal" {
    try assert.expectEqual(undefined, undefined);
}

test "arrays" {
    const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' };
    try assert.expectEqual(a[3], b[3]);
    try assert.expectEqual('l', 'l');
    try assert.expectEqual(a.len, b.len);
}

test "If Expression blocks" {
    const a = true;
    var x: u16 = 0;
    if (a) {
        x += 1;
    } else {
        x += 2;
    }
    try assert.expect(x == 1);
}

test "if statement expression" {
    const a = true; // no coerce
    var x: u16 = 0;
    x += if (a) 1 else 2;
    try expect(x == 1);
}

test "while" {
    var i: u8 = 2;
    while (i < 100) {
        i *= 2;
    }
    try expect(i == 128); // 2**99 in unsigned 8-bit integer same as (2**7) % (2**8)
}

test "while with continue expression instead of for" {
    var sum: u8 = 0;
    var i: u8 = 1;
    while (i <= 10) : (i += 1) {
        sum += i;
    }
    try expect(sum == 55);
}
