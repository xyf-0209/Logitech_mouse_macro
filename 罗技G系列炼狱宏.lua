------------------------右ctrl+鼠标右键控制整个宏开关（默认为开启状态）--------------------------------
-- 初始化函数，初始化各种变量
function Init()
    switch = true -- 记录宏的开关状态。true为开启，flase为关闭。默认为开启
    setSeed = true -- 记录是否需要初始化随机种子。true为需要，flase为不需要。默认为需要
    sprayControlKey = 4 -- 对应的鼠标按键。默认为4号键。具体的鼠标键位编号。
    curGun = "lianyu" -- 当前选择的道具。默认为炼狱。
    gunTable = {lianyu="lianyu"} -- 道具表，方便调用对应方法。
    EnablePrimaryMouseButtonEvents(true) -- 启用鼠标左键监测事件
end

Init()

-- GetTimeStamp()：通过math.randomseed()函数获取当前系统时间时间戳，GetRunningTime()函数获取脚本运行时间。两个值相加，以最大化避免多人使用该宏时使用相同的随机种子。
-- GetRunningTime()：获取当前脚本的运行时间。
function GetTimeStamp()
    return tostring(math.randomseed() + GetRunningTime()):reverse()
end

-- 生成均值mean，方差为std_dev的正态分布随机数函数（使用Box-Muller变换）
function generate_normal_random(mean, std_dev)
    -- 生成两个均匀分布的随机数（0到1之间）
    local u = math.random()
    local v = math.random()
    -- 使用Box-Muller变换转换成正态分布随机数
    local z = math.sqrt(-2.0 * math.log(u)) * math.cos(2.0 * math.pi * v)
    -- 使用均值和标准差进行线性变换
    return math.floor(mean + z * std_dev + 0.5)
end

-- 生成指定范围内满足正态分布的随机数(95.00%概率不超过n，且不小于m)
function random(m, n)
    local mean = (m + n) / 2
    local sigma = (n - m) / (2 * 1.645)  -- 1.645 0.9500 1.2815 0.9000
    local generated_random = generate_normal_random(mean, sigma)
    while (generated_random < m) do
        generated_random = math.random(m, n)
    end
    return generated_random
end

function SprayControl(gun)
    if (gun == gunTable.lianyu) then
        -- 重复执行以下操作直到侧键释放
        repeat
            -- 模拟按下鼠标左键
            PressMouseButton(1)
            -- 随机延迟一定时间（100~185毫秒）
            Sleep(random(100, 185))
            -- 松开鼠标左键
            ReleaseMouseButton(1)
            -- 随机延迟一定时间（10~25毫秒）
            Sleep(random(10, 25))
        until not IsMouseButtonPressed(sprayControlKey)
    end
end

function OnEvent(event, arg)
    -- 按下任意鼠标键的事件触发
    if (event == "MOUSE_BUTTON_PRESSED") then
        -- 右ctrl+鼠标右键：开启或关闭功能
        if (IsModifierPressed("rctrl")) then
            if (arg == 2) then
                switch = not switch
                setSeed = true
            end
        end
        -- 若当前switch为开启状态并且按住了宏开火键执行以下操作
        if (switch and arg == sprayControlKey) then
            -- 开关开启时需要进行初始化一次随机种子。
            if (setSeed) then
                -- 初始化随机种子（注意：罗技lua不支持os.time()，这里实现GetTimeStamp()函数模拟时间戳）
                GetTimeStamp()
                setSeed = false
            end
            -- 调用curGun道具的方法
            SprayControl(curGun)
        end
    end
end
