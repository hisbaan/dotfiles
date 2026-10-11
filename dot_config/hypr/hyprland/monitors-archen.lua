hl.monitor({
    output = "eDP-1",
    mode = "3840x2400@60",
    position = "0x0",
    scale = 2,
})

hl.monitor({
    output = "HKC OVERSEAS LIMITED G2411P 0000000000001",
    mode = "1920x1080@200",
    position = "1920x0",
    scale = 1,
})

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

for workspace = 1, 9 do
    hl.workspace_rule({
        workspace = tostring(workspace),
        monitor = workspace <= 5 and "DP-1" or "eDP-1",
        default = true,
        persistent = true,
    })
end
