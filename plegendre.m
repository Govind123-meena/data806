%   plegendre   - Legendre polynomial
%
%   [pvalue]    = plegendre(j,x)
%
%   _____OUTPUTS____________________________________________________________
%   pvalue  polynomial expansion corresponding to x(xwant)  (col vectors)
%
%   _____INPUTS_____________________________________________________________
%   j   degree                      (scalar)
%   x   independent scalars             (row vector)
%
%   _____SEE ALSO___________________________________________________________
%   
%
%   (C) 1998.04.22 Kui-yu Chang
%   http://lans.ece.utexas.edu/~kuiyu
 
%   This program is free software; you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation; either version 2 of the License, or
%   (at your option) any later version.
%
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with this program; if not, write to the Free Software
%   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA
%   or check
%           http://www.gnu.org/
 
function    [pvalue]    = plegendre(j,x)
 
if j==0
    pvalue  = ones(size(x));
elseif j==1
    pvalue  = x;
else
    num = (2*j-1)*x.*plegendre(j-1,x)-(j-1)*plegendre(j-2,x);
    pvalue  = num/j;
end

