const std = @import("std");

fn build_lua(b: *std.build.Builder, target: std.zig.CrossTarget, mode: std.builtin.Mode) void {
    const lua = b.addStaticLibrary("lua", null);
    lua.setTarget(target);
    lua.setBuildMode(mode);
    lua.linkLibC();
    lua.force_pic = true;
    lua.addCSourceFiles(&.{
        "lua/src/lapi.c",
        "lua/src/lauxlib.c",
        "lua/src/lbaselib.c",
        "lua/src/lcode.c",
        "lua/src/ldblib.c",
        "lua/src/ldebug.c",
        "lua/src/ldo.c",
        "lua/src/ldump.c",
        "lua/src/lfunc.c",
        "lua/src/lgc.c",
        "lua/src/linit.c",
        "lua/src/liolib.c",
        "lua/src/llex.c",
        "lua/src/lmathlib.c",
        "lua/src/lmem.c",
        "lua/src/loadlib.c",
        "lua/src/lobject.c",
        "lua/src/lopcodes.c",
        "lua/src/loslib.c",
        "lua/src/lparser.c",
        "lua/src/lstate.c",
        "lua/src/lstring.c",
        "lua/src/lstrlib.c",
        "lua/src/ltable.c",
        "lua/src/ltablib.c",
        "lua/src/ltm.c",
        "lua/src/lundump.c",
        "lua/src/lvm.c",
        "lua/src/lzio.c",
    }, &.{
        "-std=c99",
        "-Wall",
        "-Wextra",
    });
    lua.install();
}

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    build_lua(b, target, mode);
}
