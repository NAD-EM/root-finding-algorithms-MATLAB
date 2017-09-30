%Finds function root using Newton-Raphson's method.
%Usage example: "z = NewtonRaphson('x^3+2*x-2',2.1,0.00000001)"

%{
	NewtonRaphson: script to find a function's root using Newton-Raphson's method.
    Copyright (C) 2017  NAD-EM

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    You can contact the author through email:
	<git.nad.em.00@gmail.com>.
	Or through their GitHub profile:
	<https://github.com/NAD-EM>.
%}

function s = NewtonRaphson(expresion, xi, tolerableErrorRange)
warning('off','all');
format long;
syms x;
func = expresion;
decx = diff(func, x);
s = 100; %recycle variable 's' as the error margin holder
lower = xi;
count = 0;

while (s > tolerableErrorRange)
    evalf   = eval(subs(func, lower));
    evalfdx = eval(subs(decx, lower));
    upper   = lower - (evalf/evalfdx);
    
    if (isnan(upper))
        error('The method does not converge with the given value...');
    end
    
    if (count == 1)
        s = abs( (upper-lower) / upper ) * 100;
    end
    count = 1;
    lower = upper;
end
s = lower;