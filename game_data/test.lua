print('Initializing SOL/LUA..')

base = {}--_G = _G}
print('Creating base environment')
setmetatable(base, {__index = _G})
print('Done initializing SOL/LUA.')

-- Lets do some tests
_ENV = base -- change the environment. without the local, this would change the environment for the entire chunk
-- create a test room..
r1 = room.new()
r1:SetTitle('Test Title')

-- leave this environment..
_ENV = _G
r2 = base.room.new()
r2:SetTitle('Test Title2')

print( r1:GetTitle() )
print( r2:GetTitle() )

--local _ENV = _G

