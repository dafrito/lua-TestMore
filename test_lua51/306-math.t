#! /usr/bin/lua
--
-- lua-TestMore : <http://testmore.luaforge.net/>
--
-- Copyright (C) 2009, Perrad Francois
--
-- This code is licensed under the terms of the MIT/X11 license,
-- like Lua itself.
--

--[[

=head1 Lua Mathematic Library

=head2 Synopsis

    % prove 306-math.t

=head2 Description

Tests Lua Mathematic Library

See "Lua 5.1 Reference Manual", section 5.6 "Mathematical Functions",
L<http://www.lua.org/manual/5.1/manual.html#5.6>.

See "Programming in Lua", section 18 "The Mathematical Library".

=cut

--]]

require 'Test.More'

plan(43)

like(tostring(math.pi), '^3%.14', "variable pi")

if arg[-1] == 'parrot-lua' then
    is(tostring(math.huge), 'Inf', "variable huge")
elseif platform and platform.osname == 'MSWin32' then
    is(tostring(math.huge), '1.#INF', "variable huge")
else
    is(tostring(math.huge), 'inf', "variable huge")
end

is(math.abs(-12.34), 12.34, "function abs")
is(math.abs(12.34), 12.34)

like(math.acos(0.5), '^1%.047', "function acos")

like(math.asin(0.5), '^0%.523', "function asin")

like(math.atan(0.5), '^0%.463', "function atan")

like(math.atan2(1, 2), '^0%.463', "function atan2")

is(math.ceil(12.34), 13, "function ceil")
is(math.ceil(-12.34), -12)

like(math.cos(0), '^1$', "function cos")

if arg[-1] == 'parrot-lua' then
    skip("cosh")
else
    like(math.cosh(0), '^1$', "function cosh")
end

is(math.deg(math.pi), 180, "function deg")

like(math.exp(1.0), '^2%.718', "function exp")

is(math.floor(12.34), 12, "function floor")
is(math.floor(-12.34), -13)

is(math.fmod(7, 3), 1, "function fmod")
is(math.fmod(-7, 3), -1)

eq_array({math.frexp(1.5)}, {0.75, 1}, "function frexp")

is(math.ldexp(1.2, 3), 9.6, "function ldexp")

like(math.log(47), '^3%.85', "function log")

like(math.log10(47), '^1%.672', "function log10")

error_like(function () math.max() end,
           "bad argument #1 to 'max' %(number expected, got no value%)",
           "function max 0")

is(math.max(1), 1, "function max")
is(math.max(1, 2), 2)
is(math.max(1, 2, 3, -4), 3)

error_like(function () math.min() end,
           "bad argument #1 to 'min' %(number expected, got no value%)",
           "function min 0")

is(math.min(1), 1, "function min")
is(math.min(1, 2), 1)
is(math.min(1, 2, 3, -4), -4)

eq_array({math.modf(2.25)}, {2, 0.25}, "function modf")

is(math.pow(-2, 3), -8, "function pow")

like(math.rad(180), '^3%.14', "function rad")

like(math.random(), '^%d%.%d+', "function random no arg")

like(math.random(9), '^%d$', "function random 1 arg")

like(math.random(10, 19), '^1%d$', "function random 2 arg")

error_like(function () math.random(1, 2, 3) end,
           "wrong number of arguments",
           "function random too many arg")

math.randomseed(12)
a = math.random()
math.randomseed(12)
b = math.random()
is(a, b, "function randomseed")

like(math.sin(math.pi/2), '^1$', "function sin")

if arg[-1] == 'parrot-lua' then
    skip("sinh")
else
    like(math.sinh(1), '^1%.175', "function sinh")
end

like(math.sqrt(2), '^1%.414', "function sqrt")

like(math.tan(math.pi/3), '^1%.732', "function tan")

if arg[-1] == 'parrot-lua' then
    skip("tanh")
else
    like(math.tanh(1), '^0%.761', "function sinh")
end

-- Local Variables:
--   mode: lua
--   lua-indent-level: 4
--   fill-column: 100
-- End:
-- vim: ft=lua expandtab shiftwidth=4:
