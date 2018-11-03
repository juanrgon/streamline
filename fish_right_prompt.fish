function fish_right_prompt
    set -l normal_color (set_color normal)
    set -l divider ''

    set -l segments
    if set -q streamline_right_segments
        set segments $streamline_right_segments
    end

    set -l div_bg normal
    echo -n -s (set_color normal)
    for segment in $segments
        set -l components (eval $segment)
        set -l text $components[1]
        set -l bg_color $components[2]
        set -l fg_color $components[3]

        echo -n -s (set_color -b $div_bg) (set_color $bg_color) $divider
        echo -n -s (set_color -b $bg_color) (set_color $fg_color) " $text "
        set -l div_bg $bg_color
    end
    echo -n -s (set_color normal)
end
