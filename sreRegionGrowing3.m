function region = sreRegionGrowing3(im, threshold, seed)
    region = sreRecFindRegion3(im,threshold,seed,-1);
end


function region = sreRecFindRegion3(im,threshold,position,direction,region)

    if direction == -1 %first occurance
       if im(position)<threshold %check if seed is larger than threshold
            sprintf('Seed Region smaller than Threshold')
        else
            region = [];
            region = sreRecFindRegion3(im,threshold,position,0,region);%start at seed
       end
       
    else
        newpos = sreRGnewpos3(im,position,direction); %get coordinates of new position
        partofregion = sum(ismember(region,newpos)); %check if new position is already been added
        if newpos > 0
            if im(newpos) >= threshold && ~partofregion
            
                region(end+1) = newpos; %add position to region
                for ii = 1:26
                    region = sreRecFindRegion3(im,threshold,newpos,ii,region); 
                end
            end
        end
    end
end

function newposition = sreRGnewpos3(im,currentposition,direction)
    %returns new postion
    %if newposition == -1 then it is out of bounds
    [I1,I2,I3] = ind2sub(size(im),currentposition);
    [sizeI1, sizeI2,sizeI3] = size(im);
    switch direction
        case 0
        case 1
            I3 = I3-1;
        case 2
            I3 = I3+1;
        case 3  
            I2 = I2-1;
        case 4 
            I2 = I2-1;
            I3 = I3-1;
        case 5    
            I2 = I2-1;
            I3 = I3+1;
        case 6  
            I2 = I2+1;
        case 7   
            I2 = I2+1;
            I3 = I3-1;
        case 8
            I2 = I2+1;
            I3 = I3+1;
        case 9
            I1 = I1-1;
        case 10
            I1 = I1-1;
            I3 = I3-1;
        case 11
            I1 = I1-1;
            I3 = I3+1;
        case 12
            I1 = I1-1;
            I2 = I2-1;
        case 13  
            I1 = I1-1;
            I2 = I2-1;
            I3 = I3-1;
        case 14 
            I1 = I1-1;
            I2 = I2-1;
            I3 = I3+1;
        case 15    
            I1 = I1-1;
            I2 = I2+1;
        case 16  
            I1 = I1-1;
            I2 = I2+1;
            I3 = I3-1;
        case 17   
            I1 = I1-1;
            I2 = I2+1;
            I3 = I3+1;
        case 18
            I1 = I1+1;
        case 19
            I1 = I1+1;
            I3 = I3-1;
        case 20
            I1 = I1+1;
            I3 = I3+1;
        case 21
            I1 = I1+1;
            I2 = I2-1;
        case 22
            I1 = I1+1;
            I2 = I2-1;
            I3 = I3-1;
        case 23  
            I1 = I1+1;
            I2 = I2-1;
            I3 = I3+1;
        case 24 
            I1 = I1+1;
            I2 = I2+1;
        case 25    
            I1 = I1+1;
            I2 = I2+1;
            I3 = I3-1;
        case 26  
            I1 = I1+1;
            I2 = I2+1;
            I3 = I3+1;
        otherwise
            I1 = -1;
            I2 = -1;
            I3 = -1;
    end
    
    if I1 <= 0 || I2 <= 0 || I3 <= 0|| I1 > sizeI1 || I2 > sizeI2 || I3 > sizeI3
        newposition = -1;
    else
        newposition = sub2ind(size(im),I1,I2,I3);
    end
    
end