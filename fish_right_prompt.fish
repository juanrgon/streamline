function streamline_status_segment
    set -l success ''
    set -l failure ''

    set -l status_symbol
    set -l status_color
    switch $status
        case 0
            set status_symbol $success
            set status_color green
        case '*'
            set status_symbol $failure
            set status_color red
    end
    echo $status_symbol
    echo black
    echo $status_color
end

function streamline_pyenv_python_version_name
    echo " "(pyenv version-name)
    echo '3E7AAB'
    echo 'FFDB4F'
end

function fish_right_prompt
    set -l normal_color (set_color normal)
    set -l divider ''

    set -l segments streamline_status_segment streamline_pyenv_python_version_name

    set -l div_bg normal
    echo -n -s (set_color normal)
    for segment in $segments
        set components (eval $segment)
        set -l text $components[1]
        set -l bg_color $components[2]
        set -l fg_color $components[3]

        echo -n -s (set_color -b $div_bg) (set_color $bg_color) $divider
        echo -n -s (set_color -b $bg_color) (set_color $fg_color) " $text "
        set -l div_bg $bg_color
    end
    echo -n -s (set_color normal)
end
