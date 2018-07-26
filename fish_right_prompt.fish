function fish_right_prompt
    set -l normal_color (set_color normal)
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

    set -l python_yellow 'FFDB4F'
    set -l python_blue '3E7AAB'
    set -l python_version " "(pyenv version-name)

    set -l segments   $status_symbol   $python_version
    set -l bg_colors  black            $python_blue
    set -l fg_colors  $status_color    $python_yellow

    set -l div_fgs $bg_colors
    set -l div_bgs normal $bg_colors

    echo -n -s (set_color normal)
    for i in (seq (count $segments))
      echo -n -s (set_color -b $div_bgs[$i]) (set_color $div_fgs[$i]) $divider
      echo -n -s (set_color -b $bg_colors[$i]) (set_color $fg_colors[$i]) " $segments[$i] "
    end
    echo -n -s (set_color normal)
end
