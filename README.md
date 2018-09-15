<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### Streamline
> A theme for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

Inspired by the ZSH theme [Powerlevel9k](https://github.com/bhilburn/powerlevel9k)

## Install

```fish
$ omf install https://github.com/juanrgon/streamline
```


## Default Prompt

<p align="center">
<img src="screenshot.png">
</p>


## Customizable

## Builtin Segments

#### streamline_os_icon_segment

Icon of the current OS

```sh
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
```

# License

[MIT][mit] © [Juan Gonzalez][author]


[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/{{USER}}
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
