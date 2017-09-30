%Evaluate polynomial (or vector with its coefficients) and return
%the result and the coefficients of the function's derivate:
%Usage examples:
%    "[coeficients, result] = evaluatePolynomial('x^3+2*x-2'  , 2.67);"
%    "[coeficients, result] = evaluatePolynomial([1, 0, 2, -2], 2.67);"

%{
	evaluatePolynomial: Evaluate polynomial (or vector with its coefficients) and return the result and the coefficients of the function's derivate.
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

function [m,s] = evaluatePolynomial(OrderedFunction, value)
syms x;
    if (ischar(OrderedFunction))
        coeff = coeffs(OrderedFunction, x, 'all');
    else
        coeff = OrderedFunction;
    end
    aux = 2;
    Size = length(coeff);
    resFunction = 1:Size;
    resFunction(1) = coeff(1);
    while (aux <= Size)
        resFunction(aux) = coeff(aux) + ( resFunction(aux-1) * value );
        aux = aux +1;
    end
    s = resFunction(Size);
    resFunction(:,Size) = [];
    m = resFunction;
end