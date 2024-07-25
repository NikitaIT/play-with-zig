const std = @import("std");

/// docs: zig test -femit-docs main.zig
/// This is the main function for the program.
pub fn main() void {
    // Comments in Zig start with "//" and end at the next LF byte (end of line).
    // The line below is a comment and won't be executed.

    //print("Hello?", .{});
    std.debug.print("Hello, {s}!\n", .{"World"}); // another comment
}
