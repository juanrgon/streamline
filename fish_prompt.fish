function fish_prompt
    set -l arrow_top_left '╭─'
    set -l arrow_bottom_left '╰ '
    set -l divider_icon ''

    set -l os_icon
    switch (uname)
      case Darwin
        set os_icon ''
      case Linux
        set os_icon ''
      case Windows_NT
        set os_icon ''
    end
    set cwd (prompt_pwd)

    set -l normal_color (set_color normal)
    set -l blue_text (set_color blue)

    set -l segments    $os_icon  $cwd
    set -l bg_colors  black     blue
    set -l fg_colors  white     black

    if git_is_repo
        set segments $segments (git_branch_name)
        set fg_colors $fg_colors black
        if git_is_touched
          set bg_colors $bg_colors yellow
        else
          set bg_colors $bg_colors green
        end
    end

    set -l yadm_status
    switch $YADM_STATE
      case 1
        set yadm_status 'Yadm '
      case 2
        set yadm_status 'Yadm '
    end

    if [ $yadm_status != 0 ]
        set  segments   $segments   $yadm_status
        set  bg_colors  $bg_colors  black
        set  fg_colors  $fg_colors  magenta
    end

    set -l divider_bgs $bg_colors[2..(count $bg_colors)] normal
    set -l divider_fgs $bg_colors

    # Prompt elements
    echo -n -s $normal_color $blue_text $arrow_top_left
    for i in (seq (count $segments))
      echo -n -s (set_color -b $bg_colors[$i]) (set_color $fg_colors[$i]) " $segments[$i] "
      echo -n -s $normal_color (set_color -b $divider_bgs[$i]) (set_color $divider_fgs[$i]) $divider_icon
    end
    echo -n -s -e $normal_color "\n" $blue_text $arrow_bottom_left $normal_color
end
