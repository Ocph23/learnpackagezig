const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const pack_mod = b.addModule("easyprint", .{
        .root_source_file = b.path("easyprint.zig"),
        .target = target,
        .optimize = optimize,
    });

    const main_test = b.addTest(.{
        .root_module = pack_mod,
    });

    const run_main_test = b.addRunArtifact(main_test);

    const run_main_test_step = b.step("run-main-test", "Run the main test");
    run_main_test_step.dependOn(&run_main_test.step);
}
