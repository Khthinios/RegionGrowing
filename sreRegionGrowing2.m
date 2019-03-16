function region = sreRegionGrowing2(im, threshold, seed)
    region = sreRecFindRegion2(im,threshold,seed,-1);
end

function region = sreRecFindRegion2(im,threshold,position,direction,region)

    if direction == -1 
       if im(position)<threshold 
            sprintf('Seed Region smaller than Threshold');
        else
            region = [];
            region = sreRecFindRegion2(im,threshold,position,0,region);
       end
       
    else
        newpos = sreRGnewpos2(im,position,direction);
        partofregion = sum(ismember(region,newpos));
        if newpos > 0
            if im(newpos) >= threshold && ~partofregion
            
                region(end+1) = newpos;
                for ii = 1:8
                    region = sreRecFindRegion2(im,threshold,newpos,ii,region);
                end
            end
        end
       
    end
end

function newposition = sreRGnewpos2(im,currentposition,direction)
    
    [I1,I2] = ind2sub(size(im),currentposition);
    [sizeI1, sizeI2] = size(im);
    switch direction
        case 0
        case 1
            I1 = I1-1;
        case 2
            I1 = I1-1;
            I2 = I2-1;
        case 3
            I2 = I2-1;
        case 4
            I1 = I1+1;
            I2 = I2-1;
        case 5 
            I1 = I1+1;
        case 6
            I1 = I1+1;
            I2 = I2+1;
        case 7
            I2 = I2+1;
        case 8
            I1 = I1-1;
            I2 = I2+1;
        otherwise
            I1 = -1;
            I2 = -1;
    end
    
    if I1 <= 0 || I2 <= 0 || I1 > sizeI1 || I2 > sizeI2
        newposition = -1;
    else
        newposition = sub2ind(size(im),I1,I2);
    end
    
end