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
