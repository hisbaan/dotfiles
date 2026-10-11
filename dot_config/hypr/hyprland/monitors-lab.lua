hl.monitor({ output = "", disabled = true })
hl.monitor({
    output = "DP-1",
    mode = "1920x1080@200",
    position = "0x0",
    scale = 1,
    bitdepth = 8,
})

for workspace = 1, 9 do
    hl.workspace_rule({ workspace = tostring(workspace), monitor = "DP-1" })
end
