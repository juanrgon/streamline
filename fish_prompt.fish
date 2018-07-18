function fish_prompt
    set -l last_command_status $status

    set -l arrow_top_left '╭─'
    set -l arrow_bottom_left '╰'
    set -l divider_icon ''

    set -l normal_color (set_color normal)
    set -l black_text (set_color black)
    set -l blue_text (set_color blue)

    set cwd (prompt_pwd)

    set -l os_icon
    switch (uname)
      case Darwin
        set os_icon ''
      case Linux
        set os_icon ''
      case Windows_NT
        set os_icon ''
    end

    set -l texts       $os_icon  $cwd
    set -l _bg_colors  black     blue
    set -l _fg_colors  white     black

    if git_is_repo
        set texts $texts (git_branch_name)
        set _fg_colors $_fg_colors black
        if git_is_touched
          set _bg_colors $_bg_colors yellow
        else
          set _bg_colors $_bg_colors green
        end
    end

    for i in (seq (count $texts))
      set bg_colors $bg_colors (set_color -b $_bg_colors[$i])
      set fg_colors $fg_colors (set_color $_fg_colors[$i])
    end

    echo -n -s $normal_color
    echo -n -s $blue_text $arrow_top_left
    echo -n -s $fg_colors[1] $bg_colors[1] " $texts[1] "
    for i in (seq (count $texts))[2..-2]
        echo -n -s (set_color $_bg_colors[(math "$i - 1")]) $bg_colors[$i] $divider_icon
        echo -n -s $fg_colors[$i] $bg_colors[$i] " $texts[$i] "
    end
    echo -n -s (set_color $_bg_colors[-2]) $bg_colors[-1] $divider_icon
    echo -n -s $fg_colors[-1] $bg_colors[-1] " $texts[-1] "
    echo -n -s $normal_color (set_color $_bg_colors[-1]) $divider_icon
    echo -n -s -e $normal_color "\n" $blue_text $arrow_bottom_left
    echo -n -s $normal_color
end
