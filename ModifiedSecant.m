%Finds function roots using a modified version of the secant method.
%usage example: "z = ModifiedSecant('x^3+2*x-2',0.5,1.5,0.00000001)"

%{
	ModifiedSecant: script to find a functions root using a  modified version of the secant method.
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

function s = ModifiedSecant (expresion, xi, delta, tolerableErrorRange)
warning('off','all');
format long;
syms x;
func = expresion;
s = 100;
count = 0;

while (s > tolerableErrorRange)
   temp = xi + (delta * xi);
   fup   = eval(subs(func, xi));
   fdown = eval(subs(func,temp));
   newLimit = xi - ( (delta * (xi * fup)) / (fdown - fup) );
   
   if (isnan(newLimit))
        error('The method does not converge with the given value...');
   end
   
   if (count == 1)
      s = abs( (newLimit - xi) / newLimit ) * 100;
   end
   
   xi = newLimit;
   count = 1;
end
s = xi;
end