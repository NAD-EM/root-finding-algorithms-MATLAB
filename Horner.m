%Finds functions root using Horner's method:
%Usage example: "z = Horner('x^3+2*x-2',2.1,0.00000001)"

%{
	Horner: script to find a function's root using Horner's method.
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

function s = Horner( expresion, xi, tolerableErrorMargin)
warning('off','all');
format long;
syms x;
lower = xi;
s = 100;%Recycle variable 's' as the error margin holder.
func = expresion;

count = 0;

while (s > tolerableErrorMargin)
    
    [difFuncCoeff, evalFunction] = evaluatePolynomial(func, lower);
    [~, evalDifFunction] = evaluatePolynomial(difFuncCoeff, lower);
    newLimit = lower - ( evalFunction/evalDifFunction );
    
    if (isnan(newLimit))
        error('The method does not converge with the given value...');
    end
    
    if (count == 1)
       s = abs( (newLimit - lower) / newLimit ) * 100;
    end
    count = 1;
    lower = newLimit;
end
s = lower;
end