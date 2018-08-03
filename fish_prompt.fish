function streamline_os_icon_segment
    set -l os_icon
    switch (uname)
      case Darwin
        set os_icon ''
      case Linux
        set os_icon ''
      case Windows_NT
        set os_icon ''
    end
    echo $os_icon
    echo black
    echo white
end

function streamline_pwd_segment
    echo (prompt_pwd)
    echo blue
    echo white
end

function streamline_git_segment
    if git_is_repo
        echo " "(git_branch_name)
        if git_is_touched
            echo yellow
        else
            echo green
        end
        echo black
    end
end

function streamline_yadm_segment
    set -l yadm_status
    switch $YADM_STATE
      case 1
        set yadm_status 'Yadm '
      case 2
        set yadm_status 'Yadm '
      case '*'
        set yadm_status 0
    end

    if [ $yadm_status != 0 ]
        echo $yadm_status
        echo black
        echo magenta
    end
end

function fish_prompt
    set -l arrow_top_left '╭─'
    set -l arrow_bottom_left '╰ '

    set -l normal_color (set_color normal)
    set -l blue_text (set_color blue)

    set -l segments streamline_os_icon_segment streamline_pwd_segment streamline_git_segment streamline_yadm_segment

    set prompt_line_1_leader '> '
    set prompt_line_2_leader
    if [ (count $segments) != 0 ]
        set prompt_line_1_leader $normal_color $blue_text $arrow_top_left
        set prompt_line_2_leader $normal_color "\n" $blue_text $arrow_bottom_left $normal_color
    end

    # Prompt elements
    ## Initialize vars
    set bg_color normal
    set fg_color normal
    set text

    echo -n -s $prompt_line_1_leader #
    set divider_icon
    for segment in $segments
        set -l prev_bg_color $bg_color
        set -l components (eval $segment)

        set -l text
        set -l fg_color
        switch (count $components)
          case 0
            continue
          case 3
              set text $components[1]
              set bg_color $components[2]
              set fg_color $components[3]
          case '*'
              set text "("ERROR with $segment")"
              set bg_color black
              set fg_color red
        end

        echo -n -s (set_color -b $bg_color) (set_color $prev_bg_color) $divider
        echo -n -s (set_color -b $bg_color) (set_color $fg_color) " $text "
        set divider ''
    end
    echo -n -s (set_color normal) (set_color $bg_color) $divider
    echo -n -s -e $prompt_line_2_leader
end
