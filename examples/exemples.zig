const std = @import("std");
const assert = std.testing;
// zig test ./examples/assignment.zig
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
