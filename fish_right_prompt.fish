function fish_right_prompt
    set -l divider ''
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

    set -l texts       $status_symbol
    set -l _bg_colors  black
    set -l _fg_colors  $status_color

    for i in (seq (count $texts))
        set bg_colors $bg_colors (set_color -b $_bg_colors[$i])
        set fg_colors $fg_colors (set_color $_fg_colors[$i])
    end

    echo -n -s (set_color normal)
    echo -n -s (set_color $_bg_colors[1]) $divider
    echo -n -s $fg_colors[1] $bg_colors[1] " $texts[1] "
    if [ (count $texts) -gt 1 ]
      for i in (seq (count $texts))[2..-2]
          echo -n -s (set_color $_bg_colors[(math "$i - 1")]) $bg_colors[$i] $divider
          echo -n -s $fg_colors[$i] $bg_colors[$i] " $texts[$i] "
      end
    end
    echo -n -s (set_color normal)
end
