set REQUIREMENTS;
set COURSES;

param points_required{ i in REQUIREMENTS};
param points_contributed {i in REQUIREMENTS, j in COURSES};
param effort{j in COURSES};
var take{i in COURSES},binary;



minimize hassle: sum{i in COURSES} take[i]*effort[i];

s.t. point_constraints{i in REQUIREMENTS}:sum{j in COURSES} points_contributed[i,j]*take[j] >= points_required[i];
s.t. nonnegative {i in COURSES}: take[i] >=0;


data;
set REQUIREMENTS:= natural social humanity;
set COURSES:= neuroscience statistics biophysics warming;

param points_required:= natural 10 social 10 humanity 10;
param effort := neuroscience 5 statistics 5 biophysics 2 warming 2;

param points_contributed:  neuroscience statistics biophysics warming:=
natural                      8            3          5          4
social                       6            6          3          2
humanity                     4            8          1          2;

end;





  




