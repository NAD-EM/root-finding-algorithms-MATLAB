%Finds function roots using the bisection method.
%usage example: "z = Bisection('x^3+2*x-2',0.5,1.5,0.00000001)"

%{
	Bisection: script to find a function's root using the bisection method.
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

function s = Bisection(expresion,lower,upper, tolerableErrorRange)
warning('off','all');
format long;
syms x ;
func = expresion;
r = ( eval(subs(func, lower)) ) * ( eval(subs(func,upper)) ) ;
s = 100;%recycle variable 's' as the error margin holder

%check if intervals are correct...
if (r >= 0)
    error('The method does not converge with the given value...');
end
%...if so, proceed:

while (s > tolerableErrorRange)
    newLimit = (lower + upper) / 2;
    s = abs(( (lower - upper) / (lower + upper) )) * 100;
    r = ( eval(subs(func, newLimit)) ) * ( eval(subs(func, upper)) );
    
    if (r < 0)
        lower = newLimit;
    else
        upper = newLimit;
    end
end
s = newLimit;
end