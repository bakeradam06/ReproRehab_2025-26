% week2 main


%% Creating some data
% Create a folder with name "Data"
mkdir '/Users/DOB223/Library/CloudStorage/OneDrive-MedicalUniversityofSouthCarolina/Documents/lab/ac/ReproRehab/bootCamp/2week/Data';
mainPath = '/Users/DOB223/Library/CloudStorage/OneDrive-MedicalUniversityofSouthCarolina/Documents/lab/ac/ReproRehab/bootCamp/2week/Data';
cd(mainPath)

% Within the "Data" folder, add two folders: "Subject 1" & "Subject 2"
mkdir subject1
mkdir subject2

% for rest of section: i had to use matlab copilot to help me with this. primarily the command for making isSubj variable.
% i explain these tasks in comments to ensure i understand all that's happening.

temp_nSubj = dir(fullfile(pwd,'*')); % create struct, and struct.name contains list of subjects plus two extra entries ('.' and '..')
isSubj = [temp_nSubj.isdir] & ~ismember({temp_nSubj.name},{'.','..'}); % get logical array of which entry includes subject names, exclude the dots
nSubj = sum(isSubj); % return count of how many subjects present as "1" in above logical array (2). 

%% Within each "Subject X", add two files: data.csv and info.txt
% cd subject1
data = [1,2,3,4,5];
testInfo = "this is a test file for ReproRehab week2 assignment";

% add files, and a few numbers, separated by commas in each data.csv (e.g., 1,2,3)


cd subject1/ % get to subject1 folder 
write(data, testInfo);
cd ..

cd subject2/ % with this and above line, get to subject2
write(data, testInfo);
cd ..

% --------------- % 
% create function for above steps, reduces redundancy
function write(data, testInfo)
    writematrix(data, 'data.csv');
    writelines(testInfo, 'info.txt');
end
% --------------- % 


%% create struct containing contents of /Data
pathStruct = dir(mainPath); 


% GOAL: get contents from struct that are (1) isDir and (2) starts with 
% note: i had to have matlab copilot help me with this section. 

% structure indexing and removing specific indexes of arrays is something i
% struggle with - this task made me realize this.



% make array of names within struct
names = string({pathStruct.name});
% make mask of names i actually want (the subject folders)
namesMask = startsWith(names, 'subject','IgnoreCase',true); % returns logical vector whether names entry startsWith "subject"

names = names(namesMask); % remove the two dot entries from the names array using the namesMask

clear namesMask nSubj temp_nSubj testinfo data

%%
% construct both subject paths, so then we can loop through them and do operations
subjPaths = fullfile(mainPath,names);


% use subjPaths contents to loop through and complete operation
for i=1:length(subjPaths)
    cd(subjPaths{i}) % nav to subject folder. use i to index value of subjPaths cell array

    % Add name to info.txt (e.g., Dan)
    txtFile = readlines('info.txt');
    dataFile = readmatrix('data.csv');
    if i == 1
        txtFile = 'Harry';
        dataFile = [1 5 10 1 2575];
    else 
        txtFile = 'Potter';
        dataFile = [2575 1 10 5 1]; % oppppsite of above so they're unique from each other
    end
    writelines(txtFile,'info.txt');
    writematrix(dataFile,'data.csv');
end

% Make sure numbers and names are unique to subject

cd ..

%% Write a loop that iterates through all folders in the "Data" folder

txtFile2 = 'I am looping through all folders inside /Data dir';

for i=1:length(subjPaths)
    cd(subjPaths(i));
    writelines(txtFile2, 'info2.txt');
    cd ..
end
    
%% Write a nested loop that iterates through all "Subject X" folders

    % to first do this, i'll make some new folders within each subject dir
    cd subject1/
    mkdir folder11
    mkdir folder12

    cd ..
    cd subject2/
    mkdir folder22
    mkdir folder23

    clear txtFile2 testInfo
    %% now make nested loop
    txtFile3 = "I'm now looping through each subject's individual folders";
    
    for i=1:length(subjPaths)
        dirMask = isfolder(subjPaths(i));
        cd(subjPaths(i));
        
        % copilot helped here. again, not good at indexing structures yet.
        % I'll make not when help ceased.

        what = dir; % list current folder
        disp({what.name}); % print structure names 
        disp({what.isdir}); % print which structure array is dir (logical)
        names = string({what.name}); % get string array of names in structure
        isDirMask = [what.isdir];  % logical mask of which are isdir. similar to above
        % end help. what's done next i did above.
        dotMask = startsWith(names,'.','IgnoreCase',true); % logical. which indices in names array are '.' and '..'
        nmMask = startsWith(names,'folder','IgnoreCase',true); % logical. list the indices where folders are.
        finalMask = namesMask & isDirMask & ~dotMask; % create final mask for names of whcih i want
        names = names(finalMask); % remove the indices i don't want anymore (anything but the folders)
        
        for q=1:length(names)
            cd(names(q)) % cd into the first index of folder
            writelines(txtFile3,'txtFile3.txt'); % write txt file inside the folder
            cd .. % go up one level to repeat
        end
        cd ..
    end



%% Write code to load the data from data.csv and info.txt and print the results


% Store the data as a dict (Python) / struct (MATLAB), where data from info is key and data 
% from data is value (e.g., Dan: [1,2,3])


% Add another subject folder and verify that everything works and new data is added. 
    % The goal here is to not have to modify the script every time a new subject is added


% MATLAB only: pre-allocate an array to hold your data










%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% week 2 pod meeting notes %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% dir() for parsing through folder in matlab
%   matlab equivalent is string.startsWith


%%
tic
dataWo = [];
for i = 1:10000000000
    dataWo(i) = i^2;
end
toc

%% 
tic 
dataW = zeros(1,10000000000);
for i = 1:10000000000
    dataw(i) = i^2;
end
toc
