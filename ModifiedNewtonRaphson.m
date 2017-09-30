%Finds function root using Newton-Raphson's method for multiple roots.
%Usage example: "z = ModifiedNewtonRaphson('x^3+2*x-2',2.1,0.00000001)"

%{
	ModifiedNewtonRaphson: script to find a function's root using Newton-Raphson's method for multiple root.
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

function s = ModifiedNewtonRaphson(expresion, xi, tolerableErrorRange)
warning('off','all');
format long;
syms x;
func = expresion;
s = 100;
count = 0;

DifFunc = diff(expresion, x);
Dif2Func = diff(DifFunc, x);

while (s > tolerableErrorRange)
    evalFunc     = eval(subs(func, xi));
    evalDifFunc  = eval(subs(DifFunc, xi));
    evalDif2Func = eval(subs(Dif2Func, xi));
    
    newLimit = xi-((evalFunc * evalDifFunc) / ((evalDifFunc^2)-(evalFunc*evalDif2Func)));
    
    if (isnan(newLimit))
        error('The method does not converge with the given value...');
    end
    
    if (count == 1)
        s = abs((newLimit - xi) / newLimit) * 100;
    end
    xi = newLimit;
    count = 1;
end
s = xi;
end