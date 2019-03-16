# RegionGrowing
https://github.com/Khthinios/RegionGrowing
A simple region growing algorithm for matlab

**sreRegionGrowing2**: A 2D RGA that grows until all neighbouring cells are lower than a certain threshold  
eg: sreRegionGrowing2(matrix, threshold, seed_cell)    
- matrix: A 2D matrix with numerical values  
- threshold: a numerical value  
- seed_cell: position of the seed_cell using the absolute index in the matrix  
    
**sreRegionGrowing3**: Same as before just with another dimension
eg: sreRegionGrowing3(matrix, threshold, seed_cell)  
- matrix: A 3D matrix with numerical values  
- threshold: a numerical value  
- seed_cell: position of the seed_cell using the absolute index in the matrix  
    
**sreRegionGrowing3lim**: Same as 3D but with a limit on how much the region can grow from the seed cell.
eg: sreRegionGrowing3lim(matrix, threshold, seed_cell, limit)  
- matrix: A 3D matrix with numerical values  
- threshold: a numerical value  
- seed_cell: position of the seed_cell using the absolute index in the matrix  
- limit: numerical value of the maximam limit the region can grow the seed_cell  
