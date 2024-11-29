function [DTFT_Output, Frequency_Range] = DTFT(signal)
    % Frequency range: -pi to pi
    Frequency_Range = -pi:0.001:pi; % Frequency range for DTFT computation
    Signal_Length = length(signal); % Number of samples in the signal
    DTFT_Output = zeros(1, length(Frequency_Range)); % Pre-allocate memory for efficiency
    
    % Compute the DTFT
    for frequency_index = 1:length(Frequency_Range)
        current_frequency = Frequency_Range(frequency_index); % Current frequency
        frequency_component_sum = 0; % Accumulator for DTFT computation
        
        for sample_index = 1:Signal_Length
            % Compute the contribution of the current sample to the frequency component
            frequency_component_sum = frequency_component_sum + ...
            signal(sample_index) * exp(-1j * current_frequency * (sample_index - 1));
        end
        
        % Store the computed DTFT value for the current frequency
        DTFT_Output(frequency_index) = frequency_component_sum;
    end
end
