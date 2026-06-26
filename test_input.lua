-- Test Lua Script
local function calculateArea(radius)
    local pi = 3.14159265359
    local area = pi * radius * radius
    return area
end

local function factorial(n)
    if n <= 1 then return 1 end
    return n * factorial(n - 1)
end

local function main()
    local circleArea = calculateArea(7.5)
    local fact5 = factorial(5)
    print("Circle area: " .. string.format("%.2f", circleArea))
    print("Factorial of 5: " .. fact5)
end

main()
