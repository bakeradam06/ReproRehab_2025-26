% week5 main

% For the code below:
% Break the single function into smaller functions where each has a single purpose
% Give meaningful and consistent names to functions and variables
% Add input validation to ensure arguments are of expected types and in valid ranges
% Use argument blocks or default parameter values to make inputs flexible
% Add docstrings or comments explaining the purpose, inputs, outputs, and behavior of each function


function [s, avg, max_val, min_val] = calc(vals)
    s = 0;
    for i = 1:length(vals)
        s = s + vals(i);
     end

    avg = s/length(vals);
    max_val = max(vals);
    min_val = min(vals);

    fprintf('Sum: %d Average: %.2f Maximum: %d Minimum: %d', s, avg, max_val, min_val);
end

values = [5, 10, 15, 20];
calc(values);
