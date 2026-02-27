const std = @import("std");

fn print(fmt: []const u8) void {
    std.debug.print(fmt, .{});
}

test {
    try std.testing.expect(true);
}
